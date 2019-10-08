/**
 * @version 1.0.0.0
 * @copyright Copyright ©  2019
 * @compiler Bridge.NET 17.9.0
 */
Bridge.assembly("SQLite", function ($asm, globals) {
    "use strict";

    Bridge.define("SQLite.AutoIncrement", {
        inherits: [System.Attribute]
    });

    Bridge.define("SQLite.JSqlOpCodes", {
        $kind: "enum",
        statics: {
            fields: {
                SelectClause: 0,
                SelectNumber: 1,
                SelectString: 2,
                SelectName: 3,
                SelectAll: 4,
                FromClause: 5,
                FromField: 6,
                Alias: 7,
                ArgumentPlacement: 8,
                WhereClause: 9,
                HavingClause: 10,
                GroupClause: 11,
                OpenBrackets: 12,
                CloseBrackets: 13,
                Plus: 14,
                Minus: 15,
                Div: 16,
                Mul: 17,
                Larger: 18,
                Smaller: 19,
                Equal: 20,
                NotEqual: 21,
                Or: 22,
                BitWiseOr: 23,
                And: 24,
                Mod: 25,
                LargerEqual: 26,
                SmallerEqual: 27,
                BitShiftRight: 28,
                BitShiftLeft: 29,
                Not: 30,
                InnerJoin: 31,
                LeftJoin: 32,
                RightJoin: 33,
                OnClause: 34,
                OuterJoin: 35,
                EndOfQuery: 36
            }
        }
    });

    Bridge.define("SQLite.Node", {
        fields: {
            Code: 0
        }
    });

    Bridge.define("SQLite.PrimaryKey", {
        inherits: [System.Attribute]
    });

    Bridge.define("SQLite.SQLiteCommand", {
        statics: {
            fields: {
                parser: null
            }
        },
        fields: {
            Parameters: null,
            CommandText: null,
            Connection: null
        },
        ctors: {
            ctor: function (cmdText) {
                this.$initialize();
                this.CommandText = cmdText;
            },
            $ctor1: function (cmdText, connection) {
                SQLite.SQLiteCommand.ctor.call(this, cmdText);
                this.Connection = connection;
            }
        },
        methods: {
            ExecuteReader: function (T) {
                if (System.String.isNullOrWhiteSpace(this.CommandText)) {
                    throw new System.NullReferenceException.$ctor1("CommandText");
                }
                if (this.Connection == null) {
                    throw new System.NullReferenceException.$ctor1("Connection");
                }

                var nodes = SQLite.SQLiteCommand.parser.Parse(this.CommandText);


                return null;
            }
        }
    });

    Bridge.define("SQLite.SQLiteConnection", {
        fields: {
            prefix: null,
            StorageMode: 0
        },
        ctors: {
            ctor: function (path, storageMode) {
                if (path === void 0) { path = ""; }
                if (storageMode === void 0) { storageMode = 0; }

                this.$initialize();
                this.prefix = System.String.isNullOrEmpty(path) ? "" : (path || "") + ".";
                this.StorageMode = storageMode;
            }
        },
        methods: {
            CreateTable: function (T) {
                var item = this.getTable(T);
                var meta = SQLite.SQLiteTableMeta.GetMeta(T, this);

                if (item == null) {
                    this.setTable(T, new (System.Collections.Generic.List$1(T)).ctor());
                }
            },
            Insert: function (T, row) {
                var count = 0;
                var item = this.getTable(T);
                if (item != null) {
                    var rows = Newtonsoft.Json.JsonConvert.DeserializeObject(Bridge.toString(item), System.Collections.Generic.List$1(T));
                    var meta = SQLite.SQLiteTableMeta.GetMeta(T, this);
                    if (meta.HasAutoIncrement()) {
                        row[meta.AutoIncrementName] = meta.NextAutoIncrement();
                    }
                    rows.add(row);
                    count = (count + 1) | 0;

                    this.setTable(T, rows);
                }
                return count;
            },
            Update: function (T, row) {
                var item = this.getTable(T);
                if (item != null) {
                    var rows = Newtonsoft.Json.JsonConvert.DeserializeObject(Bridge.toString(item), System.Collections.Generic.List$1(T));
                    var meta = SQLite.SQLiteTableMeta.GetMeta(T, this);
                    if (meta.HasPrimaryKeyName()) {
                        var length = rows.Count;
                        var primaryKey = meta.PrimaryKeyName;
                        for (var i = 0; i < length; i = (i + 1) | 0) {
                            if (Bridge.referenceEquals(rows.getItem(i)[primaryKey], row[primaryKey])) {
                                rows.setItem(i, row);

                                this.setTable(T, rows);

                                return 1;
                            }
                        }
                    }
                }
                return 0;
            },
            UpdateAll: function (T, updates) {
                var count = 0;
                var item = this.getTable(T);
                if (item != null) {
                    var rows = Newtonsoft.Json.JsonConvert.DeserializeObject(item, System.Collections.Generic.List$1(T));
                    var meta = SQLite.SQLiteTableMeta.GetMeta(T, this);
                    if (meta.HasPrimaryKeyName()) {
                        var primaryKey = meta.PrimaryKeyName;
                        var order = System.Linq.Enumerable.from(updates, T).orderByDescending(function (b) {
                                return b[meta.PrimaryKeyName];
                            }).toList(T);
                        for (var i = (rows.Count - 1) | 0; i > 0 && order.Count > 0; i = (i - 1) | 0) {
                            for (var x = (order.Count - 1) | 0; x > 0; x = (x - 1) | 0) {
                                var orderItem = order.getItem(x);
                                if (Bridge.referenceEquals(rows.getItem(i)[primaryKey], orderItem[primaryKey])) {
                                    rows.setItem(i, orderItem);
                                    order.removeAt(x);

                                    count = (count + 1) | 0;
                                    break;
                                }
                            }
                        }

                        if (count > 0) {
                            this.setTable(T, rows);
                        }
                    }
                }
                return count;
            },
            InsertAll: function (T, inserts) {
                var $t;
                var count = 0;
                var item = this.getTable(T);
                if (item != null) {
                    var rows = Newtonsoft.Json.JsonConvert.DeserializeObject(Bridge.toString(item), System.Collections.Generic.List$1(T));
                    var meta = SQLite.SQLiteTableMeta.GetMeta(T, this);
                    var increment = meta.HasAutoIncrement();

                    $t = Bridge.getEnumerator(inserts, T);
                    try {
                        while ($t.moveNext()) {
                            var row = $t.Current;
                            if (increment) {
                                row[meta.AutoIncrementName] = meta.NextAutoIncrement(false);
                            }
                            rows.add(row);
                            count = (count + 1) | 0;
                        }
                    } finally {
                        if (Bridge.is($t, System.IDisposable)) {
                            $t.System$IDisposable$Dispose();
                        }
                    }
                    meta.Save();
                    this.setTable(T, rows);
                }
                return count;
            },
            Delete: function (T, row) {
                var item = this.getTable(T);
                if (item != null) {
                    var rows = Newtonsoft.Json.JsonConvert.DeserializeObject(Bridge.toString(item), System.Collections.Generic.List$1(T));
                    var meta = SQLite.SQLiteTableMeta.GetMeta(T, this);

                    if (meta.HasPrimaryKeyName()) {
                        var length = rows.Count;
                        var primaryKey = meta.PrimaryKeyName;
                        for (var i = 0; i < length; i = (i + 1) | 0) {
                            if (Bridge.referenceEquals(rows.getItem(i)[primaryKey], row[primaryKey])) {
                                rows.removeAt(i);

                                this.setTable(T, rows);

                                return 1;
                            }
                        }
                    }
                }
                return 0;
            },
            DeleteAll: function (T) {
                var item = this.getTable(T);
                if (item != null) {
                    var rows = Newtonsoft.Json.JsonConvert.DeserializeObject(item, System.Collections.Generic.List$1(T));
                    this.setTable(T, new (System.Collections.Generic.List$1(T)).ctor());
                    return System.Linq.Enumerable.from(rows, T).count();
                }
                return 0;
            },
            getTable: function (T) {
                return SQLite.SQLiteStorageModes.GetItem((this.prefix || "") + (Bridge.Reflection.getTypeName(T) || ""), this.StorageMode);
            },
            setTable: function (T, rows) {
                SQLite.SQLiteStorageModes.SetItem((this.prefix || "") + (Bridge.Reflection.getTypeName(T) || ""), Newtonsoft.Json.JsonConvert.SerializeObject(rows), this.StorageMode);
            },
            Table: function (T) {
                var item = this.getTable(T);
                if (item != null) {
                    var json = Bridge.toString(item);
                    var rows = Newtonsoft.Json.JsonConvert.DeserializeObject(json, System.Collections.Generic.List$1(T));
                    return rows;
                }
                throw new System.Exception("Table " + (Bridge.Reflection.getTypeName(T) || "") + " is empty.");
            }
        }
    });

    Bridge.define("SQLite.SQLiteParameter", {
        fields: {
            Name: null,
            Parameter: null
        },
        ctors: {
            ctor: function (name, parameter) {
                this.$initialize();
                this.Name = name;
                this.Parameter = parameter;
            }
        }
    });

    Bridge.define("SQLite.SQLiteParser", {
        statics: {
            fields: {
                SelectWord: null,
                FromWord: null,
                JoinWord: null,
                InnerWord: null,
                LeftWord: null,
                RightWord: null,
                OuterWord: null,
                OnWord: null,
                WhereWord: null,
                GroupWord: null,
                GroupByWord: null,
                HavingWord: null
            },
            ctors: {
                init: function () {
                    this.SelectWord = "SELECT";
                    this.FromWord = "FROM";
                    this.JoinWord = "JOIN";
                    this.InnerWord = "INNER";
                    this.LeftWord = "LEFT";
                    this.RightWord = "RIGHT";
                    this.OuterWord = "OUTER";
                    this.OnWord = "ON";
                    this.WhereWord = "WHERE";
                    this.GroupWord = "GROUP";
                    this.GroupByWord = "BY";
                    this.HavingWord = "HAVING";
                }
            }
        },
        methods: {
            Parse: function (command) {
                var tokens = new (System.Collections.Generic.List$1(SQLite.Node)).ctor();
                var tokenReader = new SQLite.SQLiteTokenReader(((command || "") + "").trim());

                if (tokenReader.EqualTo([SQLite.SQLiteParser.SelectWord])) {
                    this.ParseSelectOrGroupBy(tokenReader, tokens);
                }

                return tokens.ToArray();
            },
            ParseWhereOrHaving: function (tokenReader, tokens, isHaving, isOnClause) {
                var $t;
                if (isHaving === void 0) { isHaving = false; }
                if (isOnClause === void 0) { isOnClause = false; }
                tokenReader.MoveNext();
                if (isOnClause) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.OnClause, $t));
                } else {
                    if (isHaving) {
                        tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.HavingClause, $t));
                    } else {
                        tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.WhereClause, $t));
                    }
                }


                do {
                    if (tokenReader.EqualTo(["("])) {
                        tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.OpenBrackets, $t));
                        this.ParseExpression(tokenReader, tokens, isHaving, isOnClause);

                        if (!tokenReader.EqualTo([")"])) {
                            throw new System.Exception("Expected closing ')'");
                        } else {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.CloseBrackets, $t));
                            tokenReader.MoveNext();
                        }
                    } else {
                        this.ParseVarOrLit(tokenReader, tokens);
                    }
                    if (tokenReader.CanMoveNext) {
                        if (!isOnClause && !isHaving && tokenReader.EqualTo([SQLite.SQLiteParser.GroupWord, SQLite.SQLiteParser.GroupByWord])) {
                            this.ParseSelectOrGroupBy(tokenReader, tokens);
                            return false;
                        } else if (!isOnClause && !isHaving && tokenReader.EqualTo([SQLite.SQLiteParser.HavingWord])) {
                            this.ParseWhereOrHaving(tokenReader, tokens, true);
                            return false;
                        } else if (tokenReader.EqualTo([")"])) {
                            return false;
                        } else {
                            var prevpos = tokenReader._pos;
                            if (this.ParseSymbol(tokenReader, tokens)) {
                                return true;
                            }
                            if (tokenReader._pos === prevpos) {
                                if (isOnClause) {
                                    return false;
                                } else {
                                    if (isHaving) {
                                        throw new System.Exception("Expected , or ;");
                                    } else {
                                        throw new System.Exception("Expected , or ; or Group By or Having!");
                                    }
                                }
                            }
                        }
                    } else {
                        return false;
                    }
                } while (true);
            },
            ParseSymbol: function (tokenReader, tokens) {
                var $t;
                if (tokenReader.EqualTo(["+"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Plus, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo(["-"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Minus, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo(["/"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Div, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo(["*"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Mul, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo([">"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Larger, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo(["<"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Smaller, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo(["="])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Equal, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo(["<", ">"]) || tokenReader.EqualTo(["!", "="])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.NotEqual, $t));
                    tokenReader.MoveNext(2);
                } else if (tokenReader.EqualTo(["|"]) || tokenReader.EqualTo(["or"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Or, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo(["^"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.BitWiseOr, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo(["&"]) || tokenReader.EqualTo(["and"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.And, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo(["%"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Mod, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo(["&", "&"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.And, $t));
                    tokenReader.MoveNext(2);
                } else if (tokenReader.EqualTo(["|", "|"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Or, $t));
                    tokenReader.MoveNext(2);
                } else if (tokenReader.EqualTo([">", "="])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.LargerEqual, $t));
                    tokenReader.MoveNext(2);
                } else if (tokenReader.EqualTo(["<", "="])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.SmallerEqual, $t));
                    tokenReader.MoveNext(2);
                } else if (tokenReader.EqualTo([">", ">"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.BitShiftRight, $t));
                    tokenReader.MoveNext(2);
                } else if (tokenReader.EqualTo(["<", "<"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.BitShiftLeft, $t));
                    tokenReader.MoveNext(2);
                } else if (tokenReader.EqualTo(["!"]) || tokenReader.EqualTo(["not"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.Not, $t));
                    tokenReader.MoveNext();
                } else if (tokenReader.EqualTo([";"])) {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.EndOfQuery, $t));
                    if (tokenReader.CanMoveNext) {
                        tokenReader.MoveNext();
                    }
                    return true;
                }

                return false;
            },
            ParseFrom: function (tokenReader, tokens) {
                var $t;
                tokenReader.MoveNext();
                tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.FromClause, $t));
                var skip = false;
                do {
                    if (!skip) {
                        if (tokenReader.EqualTo(["("])) {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.OpenBrackets, $t));
                            this.ParseExpression(tokenReader, tokens);

                            if (!tokenReader.EqualTo([")"])) {
                                throw new System.Exception("Expected closing ')'");
                            } else {
                                tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.CloseBrackets, $t));
                                tokenReader.MoveNext();
                            }

                            if (tokenReader.EqualTo(["`"])) {
                                tokens.add(($t = new SQLite.NodeString(), $t.Code = SQLite.JSqlOpCodes.Alias, $t.Data1 = tokenReader.Current.substr(1, ((tokenReader.Current.length - 2) | 0)), $t));
                                tokenReader.MoveNext();
                            } else {
                                throw new System.Exception("From Clause on Expression needs Alias!");
                            }
                        } else {
                            this.ParseTableName(tokenReader, tokens);
                        }
                    } else {
                        skip = false;
                    }

                    if (tokenReader.CanMoveNext) {
                        if (tokenReader.EqualTo([SQLite.SQLiteParser.WhereWord])) {
                            this.ParseWhereOrHaving(tokenReader, tokens);
                            return;
                        } else if (tokenReader.EqualTo([SQLite.SQLiteParser.GroupWord, SQLite.SQLiteParser.GroupByWord])) {
                            this.ParseSelectOrGroupBy(tokenReader, tokens, true);
                            return;
                        } else if (tokenReader.EqualTo([SQLite.SQLiteParser.HavingWord])) {
                            this.ParseWhereOrHaving(tokenReader, tokens, true);
                            return;
                        } else if (tokenReader.EqualTo([SQLite.SQLiteParser.InnerWord, SQLite.SQLiteParser.JoinWord])) {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.InnerJoin, $t));
                            tokenReader.MoveNext(2);
                        } else if (tokenReader.EqualTo([SQLite.SQLiteParser.LeftWord, SQLite.SQLiteParser.JoinWord])) {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.LeftJoin, $t));
                            tokenReader.MoveNext(2);
                        } else if (tokenReader.EqualTo([SQLite.SQLiteParser.RightWord, SQLite.SQLiteParser.JoinWord])) {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.RightJoin, $t));
                            tokenReader.MoveNext(2);
                        } else if (tokenReader.EqualTo([SQLite.SQLiteParser.OuterWord, SQLite.SQLiteParser.JoinWord])) {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.OuterJoin, $t));
                            tokenReader.MoveNext(2);
                        } else if (tokenReader.EqualTo([SQLite.SQLiteParser.OnWord])) {
                            if (this.ParseWhereOrHaving(tokenReader, tokens, false, true)) {
                                return;
                            }
                        } else if (tokenReader.EqualTo([","])) {
                            tokenReader.MoveNext();
                        } else if (System.String.startsWith(tokenReader.Current, "`")) {
                            tokens.add(($t = new SQLite.NodeString(), $t.Code = SQLite.JSqlOpCodes.Alias, $t.Data1 = tokenReader.Current.substr(1, ((tokenReader.Current.length - 2) | 0)), $t));
                            tokenReader.MoveNext();
                            skip = true;
                        } else if (tokenReader.EqualTo([";"])) {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.EndOfQuery, $t));
                            tokenReader.MoveNext();
                            return;
                        } else if (tokenReader.EqualTo([")"])) {
                            return;
                        } else {
                            throw new System.Exception("Expected , or ; or from!");
                        }
                    } else {
                        return;
                    }
                } while (true);
            },
            ParseSelectOrGroupBy: function (tokenReader, tokens, isGroupBy) {
                var $t;
                if (isGroupBy === void 0) { isGroupBy = false; }
                tokenReader.MoveNext();
                if (isGroupBy) {
                    tokenReader.MoveNext();
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.GroupClause, $t));

                } else {
                    tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.SelectClause, $t));
                }
                var skip = false;
                do {
                    if (!skip) {
                        if (tokenReader.EqualTo(["("])) {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.OpenBrackets, $t));
                            this.ParseExpression(tokenReader, tokens, false, isGroupBy);

                            if (!tokenReader.EqualTo([")"])) {
                                throw new System.Exception("Expected closing ')'");
                            } else {
                                tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.CloseBrackets, $t));
                                tokenReader.MoveNext();
                            }
                        } else if (!isGroupBy && tokenReader.EqualTo(["*"])) {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.SelectAll, $t));
                            tokenReader.MoveNext();
                        } else {
                            this.ParseVarOrLit(tokenReader, tokens);
                        }
                    } else {
                        skip = false;
                    }

                    if (tokenReader.CanMoveNext) {
                        if (!isGroupBy && tokenReader.EqualTo([SQLite.SQLiteParser.FromWord])) {
                            this.ParseFrom(tokenReader, tokens);
                            return;
                        } else if (isGroupBy && tokenReader.EqualTo([SQLite.SQLiteParser.HavingWord])) {
                            this.ParseWhereOrHaving(tokenReader, tokens, true);
                            return;
                        } else if (tokenReader.EqualTo([","])) {
                            tokenReader.MoveNext();
                        } else if (!isGroupBy && System.String.startsWith(tokenReader.Current, "`")) {
                            tokens.add(($t = new SQLite.NodeString(), $t.Code = SQLite.JSqlOpCodes.Alias, $t.Data1 = tokenReader.Current.substr(1, ((tokenReader.Current.length - 2) | 0)), $t));
                            tokenReader.MoveNext();
                            skip = true;
                        } else if (tokenReader.EqualTo([";"])) {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.EndOfQuery, $t));
                            tokenReader.MoveNext();
                            return;
                        } else if (tokenReader.EqualTo([")"])) {
                            return;
                        } else {
                            var prevpos = tokenReader._pos;
                            this.ParseSymbol(tokenReader, tokens);
                            if (tokenReader._pos === prevpos) {
                                throw new System.Exception("Expected , or ; or from!");
                            }
                        }
                    } else {
                        return;
                    }
                } while (true);
            },
            ParseVarOrLit: function (tokenReader, tokens) {
                var $t;
                if (System.String.startsWith(tokenReader.Current, "`")) {
                    var data1 = tokenReader.Current.substr(1, ((tokenReader.Current.length - 2) | 0));
                    var data2 = "";
                    var data3 = "";

                    tokenReader.MoveNext();

                    if (Bridge.referenceEquals(tokenReader.Current, ".")) {
                        tokenReader.MoveNext();

                        if (System.String.startsWith(tokenReader.Current, "`")) {
                            data2 = tokenReader.Current.substr(1, ((tokenReader.Current.length - 2) | 0));

                            tokenReader.MoveNext();

                            if (Bridge.referenceEquals(tokenReader.Current, ".")) {
                                tokenReader.MoveNext();

                                if (System.String.startsWith(tokenReader.Current, "`")) {
                                    data3 = tokenReader.Current.substr(1, ((tokenReader.Current.length - 2) | 0));

                                    tokenReader.MoveNext();

                                    tokens.add(($t = new SQLite.NodeString3(), $t.Code = SQLite.JSqlOpCodes.SelectName, $t.Data1 = data3, $t.Data2 = data2, $t.Data3 = data1, $t));
                                } else {
                                    throw new System.Exception("Expected ` after .");
                                }
                            } else {
                                tokens.add(($t = new SQLite.NodeString2(), $t.Code = SQLite.JSqlOpCodes.SelectName, $t.Data1 = data2, $t.Data2 = data1, $t));
                            }
                        } else {
                            throw new System.Exception("Expected ` after .");
                        }
                    } else {
                        tokens.add(($t = new SQLite.NodeString(), $t.Code = SQLite.JSqlOpCodes.SelectName, $t.Data1 = data1, $t));
                    }

                    return true;
                } else if (System.String.startsWith(tokenReader.Current, "'")) {
                    tokens.add(($t = new SQLite.NodeString(), $t.Code = SQLite.JSqlOpCodes.SelectString, $t.Data1 = tokenReader.Current.substr(1, ((tokenReader.Current.length - 2) | 0)), $t));
                } else if (tokenReader.IsNumberLiteral()) {
                    tokens.add(($t = new SQLite.NodeNumber(), $t.Code = SQLite.JSqlOpCodes.SelectNumber, $t.Number1 = tokenReader.GetValue(), $t));
                } else if (System.String.startsWith(tokenReader.Current, "@")) {
                    tokens.add(($t = new SQLite.NodeString(), $t.Code = SQLite.JSqlOpCodes.ArgumentPlacement, $t.Data1 = tokenReader.Current.substr(1), $t));
                } else {
                    throw new System.Exception("Expected Value or Literal or Argument");
                }
                tokenReader.MoveNext();
                return false;
            },
            ParseTableName: function (tokenReader, tokens) {
                var $t;
                if (System.String.startsWith(tokenReader.Current, "`")) {
                    var data1 = tokenReader.Current.substr(1, ((tokenReader.Current.length - 2) | 0));
                    var data2 = "";

                    tokenReader.MoveNext();

                    if (System.String.startsWith(tokenReader.Current, ".")) {
                        tokenReader.MoveNext();
                        if (System.String.startsWith(tokenReader.Current, "`")) {
                            data2 = tokenReader.Current.substr(1, ((tokenReader.Current.length - 2) | 0));
                            tokenReader.MoveNext();
                            tokens.add(($t = new SQLite.NodeString2(), $t.Code = SQLite.JSqlOpCodes.FromField, $t.Data1 = data1, $t.Data2 = data2, $t));
                        } else {
                            throw new System.Exception("Expected ` after . in from");
                        }
                    } else {
                        tokens.add(($t = new SQLite.NodeString(), $t.Code = SQLite.JSqlOpCodes.FromField, $t.Data1 = data1, $t));
                    }
                } else {
                    throw new System.Exception("Expected Value or Literal or Argument");
                }
            },
            ParseExpression: function (tokenReader, tokens, isHaving, isGroupBy, isOnClause) {
                var $t;
                if (isHaving === void 0) { isHaving = false; }
                if (isGroupBy === void 0) { isGroupBy = false; }
                if (isOnClause === void 0) { isOnClause = false; }
                tokenReader.MoveNext();

                if (tokenReader.EqualTo([SQLite.SQLiteParser.SelectWord])) {
                    if (isHaving) {
                        throw new System.Exception("Cannot have select in a having clause!");
                    }
                    if (isGroupBy) {
                        throw new System.Exception("Cannot have select in a group by clause!");
                    }
                    if (isOnClause) {
                        throw new System.Exception("Cannot have select in a on clause!");
                    }
                    this.ParseSelectOrGroupBy(tokenReader, tokens);
                } else {
                    do {
                        if (tokenReader.EqualTo(["("])) {
                            tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.OpenBrackets, $t));
                            this.ParseExpression(tokenReader, tokens, isHaving);

                            if (!tokenReader.EqualTo([")"])) {
                                throw new System.Exception("Expected closing ')'");
                            } else {
                                tokens.add(($t = new SQLite.Node(), $t.Code = SQLite.JSqlOpCodes.CloseBrackets, $t));
                                tokenReader.MoveNext();
                            }
                        } else {
                            this.ParseVarOrLit(tokenReader, tokens);
                        }
                        if (tokenReader.CanMoveNext) {
                            if (!isOnClause && !isHaving && !isGroupBy && tokenReader.EqualTo([SQLite.SQLiteParser.GroupWord, SQLite.SQLiteParser.GroupByWord])) {
                                this.ParseSelectOrGroupBy(tokenReader, tokens, true);
                                return;
                            } else if (!isOnClause && !isHaving && tokenReader.EqualTo([SQLite.SQLiteParser.HavingWord])) {
                                this.ParseWhereOrHaving(tokenReader, tokens, true);
                                return;
                            } else if (tokenReader.EqualTo([")"])) {
                                return;
                            } else {
                                var prevpos = tokenReader._pos;
                                this.ParseSymbol(tokenReader, tokens);
                                if (tokenReader._pos === prevpos) {
                                    if (isOnClause) {
                                        return;
                                    } else {
                                        throw new System.Exception("Expected , or ; or from!");
                                    }
                                }
                            }
                        } else {
                            return;
                        }
                    } while (true);
                }
            }
        }
    });

    Bridge.define("SQLite.SQLiteStorageModes", {
        statics: {
            fields: {
                _innerStorage: null
            },
            ctors: {
                init: function () {
                    this._innerStorage = new (System.Collections.Generic.Dictionary$2(System.String,System.String)).ctor();
                }
            },
            methods: {
                SetItem: function (key, value, mode) {
                    switch (mode) {
                        case SQLite.StorageMode.LocalStorage: 
                            window.localStorage.setItem(key, value);
                            break;
                        case SQLite.StorageMode.SessionStorage: 
                            window.sessionStorage.setItem(key, value);
                            break;
                        case SQLite.StorageMode.DictinaryStorage: 
                            if (SQLite.SQLiteStorageModes._innerStorage.containsKey(key)) {
                                SQLite.SQLiteStorageModes._innerStorage.setItem(key, value);
                            } else {
                                SQLite.SQLiteStorageModes._innerStorage.add(key, value);
                            }
                            break;
                    }
                },
                GetItem: function (key, mode) {
                    switch (mode) {
                        case SQLite.StorageMode.LocalStorage: 
                            return window.localStorage.getItem(key);
                        case SQLite.StorageMode.SessionStorage: 
                            return window.sessionStorage.getItem(key);
                        case SQLite.StorageMode.DictinaryStorage: 
                            if (SQLite.SQLiteStorageModes._innerStorage.containsKey(key)) {
                                return SQLite.SQLiteStorageModes._innerStorage.getItem(key);
                            }
                            break;
                    }
                    return null;
                }
            }
        }
    });

    Bridge.define("SQLite.SQLiteTableMeta", {
        statics: {
            fields: {
                TableMetaExtension: null,
                memoryTableMeta: null
            },
            ctors: {
                init: function () {
                    this.TableMetaExtension = ".meta";
                    this.memoryTableMeta = new (System.Collections.Generic.Dictionary$2(System.String,SQLite.SQLiteTableMeta)).ctor();
                }
            },
            methods: {
                createMeta: function (T, metaString, connection) {
                    var $t;
                    var newMetaTagle = new SQLite.SQLiteTableMeta();
                    newMetaTagle._innerConnection = connection;
                    newMetaTagle._wasNew = true;
                    newMetaTagle._metaString = metaString;

                    var properties = System.Linq.Enumerable.from(Bridge.Reflection.getMembers(T, 16, 28), System.Reflection.PropertyInfo).where(function (t) {
                            return System.Linq.Enumerable.from(System.Attribute.getCustomAttributes(t, false), System.Object).count() > 0;
                        }).ToArray(System.Reflection.PropertyInfo);
                    var length = properties.length;
                    var foundAuto = false;
                    var foundPrimary = false;
                    for (var i = 0; i < length; i = (i + 1) | 0) {
                        var property = properties[System.Array.index(i, properties)];
                        var attrs = System.Attribute.getCustomAttributes(property, false);
                        if (attrs == null || attrs.length === 0) {
                            continue;
                        }

                        var name = property.n;
                        var foundboth = false;

                        $t = Bridge.getEnumerator(attrs);
                        try {
                            while ($t.moveNext()) {
                                var attribute = $t.Current;
                                if (!foundAuto && Bridge.referenceEquals(Bridge.toString(attribute), "SQLite.AutoIncrement")) {
                                    newMetaTagle.AutoIncrementName = name;
                                    foundAuto = true;
                                }

                                if (!foundPrimary && Bridge.referenceEquals(Bridge.toString(attribute), "SQLite.PrimaryKey")) {
                                    newMetaTagle.PrimaryKeyName = name;
                                    foundPrimary = true;
                                }

                                if (foundPrimary && foundAuto) {
                                    foundboth = true;
                                    break;
                                }
                            }
                        } finally {
                            if (Bridge.is($t, System.IDisposable)) {
                                $t.System$IDisposable$Dispose();
                            }
                        }

                        if (foundboth) {
                            break;
                        }
                    }

                    newMetaTagle.Save();

                    return newMetaTagle;
                },
                GetMeta: function (T, connection) {
                    var metaString = (connection.prefix || "") + (Bridge.Reflection.getTypeName(T) || "") + (SQLite.SQLiteTableMeta.TableMetaExtension || "");

                    var item = SQLite.SQLiteStorageModes.GetItem(metaString, connection.StorageMode);
                    if (item == null) {
                        var newMeta = SQLite.SQLiteTableMeta.createMeta(T, metaString, connection);

                        SQLite.SQLiteTableMeta.memoryTableMeta.add(metaString, newMeta);

                        return newMeta;
                    } else {
                        var oldMeta = null;
                        if (SQLite.SQLiteTableMeta.memoryTableMeta.containsKey(metaString)) {
                            oldMeta = SQLite.SQLiteTableMeta.memoryTableMeta.getItem(metaString);
                        } else {
                            oldMeta = Newtonsoft.Json.JsonConvert.DeserializeObject(item, SQLite.SQLiteTableMeta);

                            SQLite.SQLiteTableMeta.memoryTableMeta.add(metaString, oldMeta);
                        }

                        oldMeta._innerConnection = connection;
                        oldMeta._metaString = metaString;
                        return oldMeta;
                    }
                }
            }
        },
        fields: {
            _metaString: null,
            _wasNew: false,
            AutoIncrementTotal: System.Int64(0),
            AutoIncrementName: null,
            PrimaryKeyName: null,
            _innerConnection: null,
            /**
             * The amount to increase
             *
             * @instance
             * @public
             * @memberof SQLite.SQLiteTableMeta
             * @default 1
             * @type System.Int64
             */
            AutoIncrementSet: System.Int64(0)
        },
        ctors: {
            init: function () {
                this.AutoIncrementTotal = System.Int64(0);
                this.AutoIncrementSet = System.Int64(1);
            }
        },
        methods: {
            HasAutoIncrement: function () {
                return !System.String.isNullOrWhiteSpace(this.AutoIncrementName);
            },
            HasPrimaryKeyName: function () {
                return !System.String.isNullOrWhiteSpace(this.PrimaryKeyName);
            },
            NextAutoIncrement: function (saveMeta) {
                if (saveMeta === void 0) { saveMeta = true; }
                this.AutoIncrementTotal = this.AutoIncrementTotal.add(this.AutoIncrementSet);

                if (saveMeta) {
                    this.Save();
                }

                return this.AutoIncrementTotal;
            },
            Save: function () {
                SQLite.SQLiteStorageModes.SetItem(this._metaString, Newtonsoft.Json.JsonConvert.SerializeObject(this), this._innerConnection.StorageMode);
            },
            WasNew: function () {
                return this._wasNew;
            }
        }
    });

    Bridge.define("SQLite.SQLiteTokenReader", {
        statics: {
            fields: {
                NameChar: 0,
                StringChar: 0
            },
            ctors: {
                init: function () {
                    this.NameChar = 96;
                    this.StringChar = 39;
                }
            }
        },
        fields: {
            Words: null,
            _pos: 0
        },
        props: {
            Current: {
                get: function () {
                    return this.Words[System.Array.index(this._pos, this.Words)];
                }
            },
            CanMoveNext: {
                get: function () {
                    return this._pos < this.Words.length;
                }
            },
            Next: {
                get: function () {
                    return this.Words[System.Array.index(((this._pos + 1) | 0), this.Words)];
                }
            }
        },
        ctors: {
            ctor: function (source) {
                var $t;
                this.$initialize();
                var wl = new (System.Collections.Generic.List$1(System.String)).ctor();
                var ifn = false;
                var selected = 0;

                var b = new System.Text.StringBuilder();

                for (var i = 0; i < source.length; i = (i + 1) | 0) {
                    if (((SQLite.SQLiteTokenReader.NameChar === 96 || SQLite.SQLiteTokenReader.StringChar === 39) && !ifn) || (ifn && selected === source.charCodeAt(i))) {
                        if (ifn) {
                            b.append(String.fromCharCode(source.charCodeAt(i)));

                            wl.add(b.toString());
                            b = new System.Text.StringBuilder();
                            selected = 0;
                        } else {
                            selected = source.charCodeAt(i);
                            if (b.getLength() > 0) {
                                wl.add(b.toString());
                                b = new System.Text.StringBuilder();
                            }
                            b.append(String.fromCharCode(source.charCodeAt(i)));
                        }
                        ifn = !ifn;
                    } else {
                        if (ifn) {
                            b.append(String.fromCharCode(source.charCodeAt(i)));
                        } else {
                            if (System.Char.isWhiteSpace(String.fromCharCode(source.charCodeAt(i)))) {
                                if (b.getLength() > 0) {
                                    wl.add(b.toString());
                                    b = new System.Text.StringBuilder();
                                }
                                continue;
                            } else if (!($t = source.charCodeAt(i), (System.Char.isDigit($t) || System.Char.isLetter($t)))) {
                                if (b.getLength() > 0) {
                                    wl.add(b.toString());
                                    b = new System.Text.StringBuilder();
                                }
                                wl.add(String.fromCharCode(source.charCodeAt(i)));
                            } else {
                                b.append(String.fromCharCode(source.charCodeAt(i)));
                            }
                        }
                    }
                }

                if (b.getLength() > 0) {
                    wl.add(b.toString());
                }

                this.Words = wl.ToArray();
            }
        },
        methods: {
            MoveNext: function (count) {
                if (count === void 0) { count = 1; }
                return ((this._pos = (this._pos + count) | 0)) < this.Words.length;
            },
            GetValue: function () {
                return System.Decimal(this.Words[System.Array.index(this._pos, this.Words)]);
            },
            IsNumberLiteral: function () {
                var x = this.Words[System.Array.index(this._pos, this.Words)];

                if (x.length === 0) {
                    return false;
                }
                var TotalDots = 0;
                for (var i = 0; i < x.length; i = (i + 1) | 0) {
                    if (!System.Char.isNumber(x.charCodeAt(i))) {
                        if (x.charCodeAt(i) === 46) {
                            TotalDots = (TotalDots + 1) | 0;
                            if (TotalDots === 1) {
                                continue;
                            }
                        }
                        return false;
                    }
                }

                return true;
            },
            EqualTo: function (words) {
                if (words === void 0) { words = []; }
                var Total = 0;
                var index = 0;
                for (var i = this._pos; i < ((this._pos + words.length) | 0) && i < this.Words.length; i = (i + 1) | 0) {
                    if (Bridge.referenceEquals(words[System.Array.index(index, words)].toLowerCase(), this.Words[System.Array.index(i, this.Words)].toLowerCase())) {
                        Total = (Total + 1) | 0;
                    } else {
                        return false;
                    }
                    index = (index + 1) | 0;
                }
                return Total === words.length;
            }
        }
    });

    Bridge.define("SQLite.StorageMode", {
        $kind: "enum",
        statics: {
            fields: {
                LocalStorage: 0,
                SessionStorage: 1,
                /**
                 * single process only
                 *
                 * @static
                 * @public
                 * @memberof SQLite.StorageMode
                 * @constant
                 * @default 2
                 * @type SQLite.StorageMode
                 */
                DictinaryStorage: 2
            }
        }
    });

    Bridge.define("SQLite.NodeNumber", {
        inherits: [SQLite.Node],
        fields: {
            Number1: System.Decimal(0.0)
        }
    });

    Bridge.define("SQLite.NodeString", {
        inherits: [SQLite.Node],
        fields: {
            Data1: null
        }
    });

    Bridge.define("SQLite.NodeString2", {
        inherits: [SQLite.NodeString],
        fields: {
            Data2: null
        }
    });

    Bridge.define("SQLite.NodeString3", {
        inherits: [SQLite.NodeString2],
        fields: {
            Data3: null
        }
    });
});
