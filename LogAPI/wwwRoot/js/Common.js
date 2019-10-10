/**
 * @version 1.0.0.0
 * @copyright Copyright ©  2019
 * @compiler Bridge.NET 17.9.0
 */
Bridge.assembly("Common", function ($asm, globals) {
    "use strict";

    Bridge.definei("Common.Interfaces.IRestful$1", function (T) { return {
        $kind: "interface"
    }; });

    Bridge.define("Common.Models.SaleLeaderBoardDataPoint", {
        fields: {
            gdp: 0,
            url: null
        }
    });

    Bridge.define("LogAPI.Models.Accessory", {
        fields: {
            Id: 0,
            TruckId: null,
            Name: null,
            Version: null,
            VendorId: 0,
            Price: System.Decimal(0.0),
            Currency: null,
            AssembledDate: null,
            ExpiredDate: null,
            MaintenancePeriod: null,
            NextMaintenanceDate: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Vendor: null,
            Truck: null,
            UserInserted: null,
            UserUpdated: null,
            TruckMaintenanceDetail: null,
            MaintenanceTicket: null,
            TruckMonitorConfig: null
        },
        ctors: {
            init: function () {
                this.AssembledDate = System.DateTime.getDefaultValue();
                this.ExpiredDate = System.DateTime.getDefaultValue();
                this.MaintenancePeriod = new System.TimeSpan();
                this.NextMaintenanceDate = System.DateTime.getDefaultValue();
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.TruckMaintenanceDetail = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMaintenanceDetail)).ctor();
                this.MaintenanceTicket = new (System.Collections.Generic.HashSet$1(LogAPI.Models.MaintenanceTicket)).ctor();
                this.TruckMonitorConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMonitorConfig)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.CommodityType", {
        fields: {
            Id: 0,
            TypeName: null,
            Description: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            UserInserted: null,
            UserUpdated: null,
            OrderDetail: null,
            Quotation: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.OrderDetail = new (System.Collections.Generic.HashSet$1(LogAPI.Models.OrderDetail)).ctor();
                this.Quotation = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.Container", {
        fields: {
            Id: 0,
            VendorId: 0,
            ContainerTypeId: 0,
            Code: null,
            Status: null,
            Description: null,
            FreightStateId: 0,
            UsedDate: null,
            ExpiredDate: null,
            MaintenancePeriod: null,
            NextMaintenanceDate: null,
            IsMaintaining: false,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            FreightState: null,
            UserInserted: null,
            UserUpdated: null,
            Vendor: null,
            ContainerMonitorConfig: null,
            Coordination: null,
            MaintenanceTicket: null
        },
        ctors: {
            init: function () {
                this.UsedDate = System.DateTime.getDefaultValue();
                this.ExpiredDate = System.DateTime.getDefaultValue();
                this.MaintenancePeriod = new System.TimeSpan();
                this.NextMaintenanceDate = System.DateTime.getDefaultValue();
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.ContainerMonitorConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.ContainerMonitorConfig)).ctor();
                this.Coordination = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Coordination)).ctor();
                this.MaintenanceTicket = new (System.Collections.Generic.HashSet$1(LogAPI.Models.MaintenanceTicket)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.ContainerMaintenance", {
        fields: {
            Id: 0,
            ContainerId: 0,
            VendorId: 0,
            StartDate: null,
            EndDate: null,
            AdvancedPaid: System.Decimal(0.0),
            Paid: false,
            Total: 0,
            Currency: null,
            AccountableUserId: 0,
            TicketId: 0,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null
        },
        ctors: {
            init: function () {
                this.StartDate = System.DateTime.getDefaultValue();
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.ContainerMonitorConfig", {
        fields: {
            Id: 0,
            ContainerId: 0,
            AssigneeId: null,
            RoleId: null,
            GroupRoleId: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Container: null,
            UserInserted: null,
            GroupRole: null,
            Role: null,
            UserUpdated: null,
            User: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.ContainerType", {
        fields: {
            Id: 0,
            TypeName: null,
            Description: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            UserInserted: null,
            UserUpdated: null,
            Quotation: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Quotation = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.Contract", {
        fields: {
            Id: 0,
            UserId: 0,
            StartDate: null,
            EndDate: null,
            Salary: 0,
            Currency: null,
            Allowance: 0,
            Details: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            User: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.StartDate = System.DateTime.getDefaultValue();
                this.EndDate = System.DateTime.getDefaultValue();
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
            }
        }
    });

    Bridge.define("LogAPI.Models.Coordination", {
        fields: {
            Id: 0,
            OrderDetailId: 0,
            TruckId: 0,
            DriverId: 0,
            FromId: 0,
            ToId: 0,
            Distance: 0,
            FreightStateId: 0,
            ContainerId: 0,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Container: null,
            FreightState: null,
            OrderDetail: null,
            FromTerminal: null,
            ToTerminal: null,
            Truck: null,
            Driver: null,
            UserInserted: null,
            UserUpdated: null,
            FreightBalance: null,
            FreightHistory: null,
            UserBalance: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.FreightBalance = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightBalance)).ctor();
                this.FreightHistory = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightHistory)).ctor();
                this.UserBalance = new (System.Collections.Generic.HashSet$1(LogAPI.Models.UserBalance)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.Customer", {
        fields: {
            Id: 0,
            FirstName: null,
            LastName: null,
            PhoneNumber: null,
            PhoneNumber2: null,
            Address: null,
            Address2: null,
            NationalityId: 0,
            DoB: null,
            SSN: null,
            Passport: null,
            Avatar: null,
            CustomerGroupId: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            CustomerGroup: null,
            Nationality: null,
            UserInserted: null,
            UserUpdated: null,
            Order: null,
            Quotation: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Order = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Order)).ctor();
                this.Quotation = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.CustomerGroup", {
        fields: {
            Id: 0,
            GroupName: null,
            Description: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Customer: null,
            Quotation: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Customer = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Customer)).ctor();
                this.Quotation = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.Department", {
        fields: {
            Id: 0,
            Name: null,
            LeaderId: 0,
            Description: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Leader: null,
            UserInserted: null,
            UserUpdated: null,
            UserInDepartment: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.UserInDepartment = new (System.Collections.Generic.HashSet$1(LogAPI.Models.User)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.Feature", {
        fields: {
            Id: 0,
            FeatureName: null,
            Description: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            UserInserted: null,
            RightByGroup: null,
            RightByRole: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.RightByGroup = new (System.Collections.Generic.HashSet$1(LogAPI.Models.RightByGroup)).ctor();
                this.RightByRole = new (System.Collections.Generic.HashSet$1(LogAPI.Models.RightByRole)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.FreightBalance", {
        fields: {
            Id: 0,
            CoordinationId: null,
            Debit: 0,
            Credit: 0,
            Curency: null,
            ObjectiveId: 0,
            RefferenceId: null,
            Entity: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Coordination: null,
            Objective: null,
            User: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.FreightHistory", {
        fields: {
            Id: 0,
            CoordinatorId: 0,
            FreightStateId: 0,
            Long: 0,
            Lat: 0,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Coordination: null,
            FreightState: null,
            UserInserted: null,
            UserUpdated: null,
            FreightProof: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.FreightProof = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightProof)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.FreightProof", {
        fields: {
            Id: 0,
            FreightHistoryId: 0,
            Image: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            FreightHistory: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.FreightState", {
        fields: {
            Id: 0,
            Name: null,
            Description: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Container: null,
            Coordination: null,
            FreightHistory: null,
            UserInserted: null,
            UserUpdated: null,
            Truck: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Container = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Container)).ctor();
                this.Coordination = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Coordination)).ctor();
                this.FreightHistory = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightHistory)).ctor();
                this.Truck = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Truck)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.GroupRole", {
        fields: {
            Id: 0,
            Name: null,
            Description: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            ContainerMonitorConfig: null,
            PaymentApprovalConfig: null,
            UserInserted: null,
            UserUpdated: null,
            MaintenanceTicket: null,
            TruckMonitorConfig: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.ContainerMonitorConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.ContainerMonitorConfig)).ctor();
                this.PaymentApprovalConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.PaymentApprovalConfig)).ctor();
                this.MaintenanceTicket = new (System.Collections.Generic.HashSet$1(LogAPI.Models.MaintenanceTicket)).ctor();
                this.TruckMonitorConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMonitorConfig)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.MaintenanceTicket", {
        fields: {
            Id: 0,
            TruckId: null,
            AccessaryId: null,
            ContainerId: null,
            AssigneeId: null,
            RoleId: null,
            GroupRoleId: null,
            TicketStateId: 0,
            HasAction: false,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Accessory: null,
            Container: null,
            GroupRole: null,
            Assignee: null,
            Role: null,
            TicketState: null,
            Truck: null,
            UserInserted: null,
            UserUpdated: null,
            TruckMaintenance: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.TruckMaintenance = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMaintenance)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.Nationality", {
        fields: {
            Id: 0,
            Name: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Customer: null,
            User: null,
            User1: null,
            Terminal: null,
            User2: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Customer = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Customer)).ctor();
                this.Terminal = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Terminal)).ctor();
                this.User2 = new (System.Collections.Generic.HashSet$1(LogAPI.Models.User)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.Objective", {
        fields: {
            Id: 0,
            Description: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            FreightBalance: null,
            UserBalance: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.FreightBalance = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightBalance)).ctor();
                this.UserBalance = new (System.Collections.Generic.HashSet$1(LogAPI.Models.UserBalance)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.Order", {
        fields: {
            Id: 0,
            CustomerId: 0,
            ContactFirstName: null,
            ContactLastName: null,
            ContactNumber: null,
            ContactSSN: null,
            ContactPassport: null,
            ContactAddress: null,
            FromId: 0,
            ToId: 0,
            TotalContainer: null,
            TotalPrice: 0,
            Currency: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Customer: null,
            FromTerminal: null,
            ToTerminal: null,
            User: null,
            UserUpdated: null,
            OrderDetail: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.OrderDetail = new (System.Collections.Generic.HashSet$1(LogAPI.Models.OrderDetail)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.OrderDetail", {
        fields: {
            Id: 0,
            OrderId: 0,
            IsContainer: false,
            TotalContainer: null,
            ContainerTypeId: null,
            VendorId: null,
            CommodityTypeId: 0,
            Weight: null,
            Volume: null,
            TimeboxId: null,
            QuotationId: null,
            Price: System.Decimal(0.0),
            Currency: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            CommodityType: null,
            Coordination: null,
            Order: null,
            Timebox: null,
            User: null,
            UserUpdated: null,
            Vendor: null,
            Surcharge: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Coordination = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Coordination)).ctor();
                this.Surcharge = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Surcharge)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.PaymentApproval", {
        fields: {
            Id: 0,
            ApproverId: 0,
            AdvancePaymentId: 0,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.PaymentApprovalConfig", {
        fields: {
            Id: 0,
            UserId: null,
            RoleId: null,
            GroupRoleId: null,
            MaxApproval: 0,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            GroupRole: null,
            Role: null,
            User: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.Quotation", {
        fields: {
            Id: 0,
            CustomerId: null,
            CustomerGroupId: null,
            FromId: 0,
            ToId: 0,
            ContainerTypeId: null,
            IsContainer: false,
            TotalContainer: null,
            VendorId: null,
            CommodityTypeId: 0,
            WeightRangeId: null,
            VolumeRangeId: null,
            TimeboxId: null,
            EffectiveDate: null,
            ExpiredDate: null,
            Price: System.Decimal(0.0),
            Currency: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            CommodityType: null,
            ContainerType: null,
            Customer: null,
            CustomerGroup: null,
            FromTerminal: null,
            ToTerminal: null,
            Timebox: null,
            UserInserted: null,
            UserUpdated: null,
            Vendor: null,
            VolumeRange: null,
            WeightRange: null
        },
        ctors: {
            init: function () {
                this.EffectiveDate = System.DateTime.getDefaultValue();
                this.ExpiredDate = System.DateTime.getDefaultValue();
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.RightByGroup", {
        fields: {
            Id: 0,
            GroupId: 0,
            FeatureId: 0,
            CanRead: false,
            CanWrite: false,
            CanDelete: false,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Feature: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.RightByRole", {
        fields: {
            Id: 0,
            RoleId: 0,
            FeatureId: 0,
            CanRead: false,
            CanWrite: false,
            CanDelete: false,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Feature: null,
            Role: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.RightByUser", {
        fields: {
            Id: 0,
            UserId: 0,
            FeatureId: 0,
            CanRead: false,
            CanWrite: false,
            CanDelete: false,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            UserUpdated: null,
            UserRight: null,
            UserInserted: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.Role", {
        fields: {
            Id: 0,
            RoleName: null,
            Description: null,
            GroupId: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            ContainerMonitorConfig: null,
            MaintenanceTicket: null,
            PaymentApprovalConfig: null,
            RightByRole: null,
            TruckMonitorConfig: null,
            User: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.ContainerMonitorConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.ContainerMonitorConfig)).ctor();
                this.MaintenanceTicket = new (System.Collections.Generic.HashSet$1(LogAPI.Models.MaintenanceTicket)).ctor();
                this.PaymentApprovalConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.PaymentApprovalConfig)).ctor();
                this.RightByRole = new (System.Collections.Generic.HashSet$1(LogAPI.Models.RightByRole)).ctor();
                this.TruckMonitorConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMonitorConfig)).ctor();
                this.User = new (System.Collections.Generic.HashSet$1(LogAPI.Models.User)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.Surcharge", {
        fields: {
            Id: 0,
            OrderDetailId: 0,
            Price: System.Decimal(0.0),
            Currency: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            OrderDetail: null,
            UserInserted: null,
            UpdatedUser: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.Terminal", {
        fields: {
            Id: 0,
            FullName: null,
            ShortName: null,
            Address: null,
            NationalityId: 0,
            Long: 0,
            Lat: 0,
            ContactNumber: null,
            ContactFirstName: null,
            ContactLastName: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            CoordinationFromTerminal: null,
            CoordinationToTerminal: null,
            Nationality: null,
            OrderFromTerminal: null,
            OrderToTerminal: null,
            QuotationFromTerminal: null,
            QuotationToTerminal: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.CoordinationFromTerminal = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Coordination)).ctor();
                this.CoordinationToTerminal = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Coordination)).ctor();
                this.OrderFromTerminal = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Order)).ctor();
                this.QuotationFromTerminal = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
                this.QuotationToTerminal = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.TicketState", {
        fields: {
            Id: 0,
            Name: null,
            Description: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            MaintenanceTicket: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.Timebox", {
        fields: {
            Id: 0,
            TimeboxStart: null,
            TimeboxEnd: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            OrderDetail: null,
            Quotation: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.TimeboxStart = new System.TimeSpan();
                this.TimeboxEnd = new System.TimeSpan();
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.OrderDetail = new (System.Collections.Generic.HashSet$1(LogAPI.Models.OrderDetail)).ctor();
                this.Quotation = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.Truck", {
        fields: {
            Id: 0,
            TruckPlate: null,
            FreightStateId: 0,
            BrandName: null,
            Version: null,
            VendorId: 0,
            Long: null,
            Lat: null,
            DriverId: 0,
            Price: System.Decimal(0.0),
            Currency: null,
            BoughtDate: null,
            ActiveDate: null,
            ExpiredDate: null,
            MaintenanceStart: null,
            MaintenanceEnd: null,
            NextMaintenanceDate: null,
            MaintenancePeriod: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Accessory: null,
            Coordination: null,
            FreightState: null,
            MaintenanceTicket: null,
            TruckMaintenance: null,
            TruckMonitorConfig: null
        },
        ctors: {
            init: function () {
                this.BoughtDate = System.DateTime.getDefaultValue();
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Accessory = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Accessory)).ctor();
                this.Coordination = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Coordination)).ctor();
                this.MaintenanceTicket = new (System.Collections.Generic.HashSet$1(LogAPI.Models.MaintenanceTicket)).ctor();
                this.TruckMaintenance = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMaintenance)).ctor();
                this.TruckMonitorConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMonitorConfig)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.TruckMaintenance", {
        fields: {
            Id: 0,
            TruckId: null,
            VendorId: 0,
            StartDate: null,
            EndDate: null,
            AdvancedPaid: System.Decimal(0.0),
            Paid: false,
            Total: 0,
            Currency: null,
            AccountableUserId: 0,
            TicketId: 0,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            MaintenanceTicket: null,
            Truck: null,
            TruckMaintenanceDetail: null,
            AccoutableUser: null,
            UserInserted: null,
            UserUpdated: null,
            Vendor: null
        },
        ctors: {
            init: function () {
                this.StartDate = System.DateTime.getDefaultValue();
                this.EndDate = System.DateTime.getDefaultValue();
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.TruckMaintenanceDetail = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMaintenanceDetail)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.TruckMaintenanceDetail", {
        fields: {
            Id: 0,
            MaintenanceId: 0,
            AccessaryId: null,
            Detail: null,
            Price: System.Decimal(0.0),
            Currency: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Accessory: null,
            TruckMaintenance: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.TruckMonitorConfig", {
        fields: {
            Id: 0,
            TruckId: 0,
            AccessaryId: null,
            UserId: null,
            RoleId: null,
            GroupRoleId: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Accessory: null,
            GroupRole: null,
            Role: null,
            Truck: null,
            User: null,
            UserInserted: null,
            UseUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.User", {
        fields: {
            Id: 0,
            FirstName: null,
            LastName: null,
            DoB: null,
            SSN: null,
            Passport: null,
            Address: null,
            Address2: null,
            PhoneNumber: null,
            PhoneNumber2: null,
            NationalityId: 0,
            SupervisorId: null,
            DepartmentId: null,
            RoleId: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: null,
            UpdatedDate: null,
            UpdatedBy: null,
            AccessoryInsertedBy: null,
            AccessoryUpdatedBy: null,
            CommodityTypeInsertedBy: null,
            CommodityTypeUpdatedBy: null,
            ContainerInsertedBy: null,
            ContainerUpdatedBy: null,
            ContainerMonitorConfigInsertedBy: null,
            ContainerMonitorConfigUpdatedBy: null,
            AssignedContainerMonitorConfig: null,
            ContainerTypeInsertedBy: null,
            ContainerTypeUpdatedBy: null,
            Contract: null,
            ContractInsertedBy: null,
            ContractUpdatedBy: null,
            Coordination: null,
            CoordinationInsertedBy: null,
            CoordinationUpdatedBy: null,
            CustomerInsertedBy: null,
            CustomerUpdatedBy: null,
            DepartmentLeader: null,
            DepartmentInsertedBy: null,
            DepartmentUpdatedBy: null,
            Supervisor: null,
            Reporter: null,
            Department: null,
            FeatureInsertedBy: null,
            FreightBalance: null,
            FreightBalanceUpdatedBy: null,
            FreightHistoryInsertedBy: null,
            FreightHistoryUpdatedBy: null,
            FreightProofInsertedBy: null,
            FreightProofUpdatedBy: null,
            FreightStateInsertedBy: null,
            FreightStateUpdatedBy: null,
            GroupRoleInsertedBy: null,
            GroupRoleUpdatedBy: null,
            MaintenanceTicketAssignee: null,
            MaintenanceTicketInsertedBy: null,
            MaintenanceTicketUpdatedBy: null,
            NationalityInsertedBy: null,
            NationalityUpdatedBy: null,
            Order: null,
            OrderUpdatedBy: null,
            OrderDetail: null,
            OrderDetailUpdatedBy: null,
            PaymentApprovalConfig: null,
            PaymentApprovalConfigInsertedBy: null,
            PaymentApprovalConfigUpdated: null,
            QuotationInsertdBy: null,
            QuotationUpdatedBy: null,
            RightByGroupInsertedBy: null,
            RightByGroupUpdated: null,
            RightByRoleInsertedBy: null,
            RightByRoleUpdatedBy: null,
            RightByUserUpdatedBy: null,
            UserRight: null,
            RightByUserInserted: null,
            Role: null,
            SurchargeInsertedBy: null,
            SurchargeUpdated: null,
            TerminalInserted: null,
            TerminalUpdated: null,
            TicketStateInsertedBy: null,
            TicketStateUpdatedBy: null,
            TimeboxInsertedBy: null,
            TimeboxUpdatedBy: null,
            TruckMaintenanceAccountable: null,
            TruckMaintenanceInsertedBy: null,
            TruckMaintenanceUpdatedBY: null,
            TruckMaintenanceDetailInsertedBy: null,
            TruckMaintenanceDetailUpdatedBy: null,
            TruckMonitorConfig: null,
            TruckMonitorConfigInsertedBy: null,
            TruckMonitorConfigUpdatedBy: null,
            UserInsertedBy: null,
            UserInserted: null,
            UserUpdatedBy: null,
            UserUpdated: null,
            UserBalance: null,
            UserBalanceInsertedBy: null,
            UserBalanceUpdatedBy: null,
            VendorTypeInsertedBy: null,
            VendorTypeUpdatedBy: null,
            VolumeRangeInsertedBy: null,
            VolumeRangeUpdatedBy: null,
            WeightRangeInsertedBy: null,
            WeightRangeUpdatedBy: null
        },
        props: {
            FullName: {
                get: function () {
                    return (this.FirstName || "") + " " + (this.LastName || "");
                }
            }
        },
        ctors: {
            init: function () {
                this.DoB = System.DateTime.getDefaultValue();
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.AccessoryInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Accessory)).ctor();
                this.AccessoryUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Accessory)).ctor();
                this.CommodityTypeInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.CommodityType)).ctor();
                this.CommodityTypeUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.CommodityType)).ctor();
                this.ContainerInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Container)).ctor();
                this.ContainerUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Container)).ctor();
                this.ContainerMonitorConfigInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.ContainerMonitorConfig)).ctor();
                this.ContainerMonitorConfigUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.ContainerMonitorConfig)).ctor();
                this.AssignedContainerMonitorConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.ContainerMonitorConfig)).ctor();
                this.ContainerTypeInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.ContainerType)).ctor();
                this.ContainerTypeUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.ContainerType)).ctor();
                this.Contract = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Contract)).ctor();
                this.ContractInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Contract)).ctor();
                this.ContractUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Contract)).ctor();
                this.Coordination = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Coordination)).ctor();
                this.CoordinationInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Coordination)).ctor();
                this.CoordinationUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Coordination)).ctor();
                this.CustomerInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Customer)).ctor();
                this.CustomerUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Customer)).ctor();
                this.DepartmentLeader = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Department)).ctor();
                this.DepartmentInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Department)).ctor();
                this.DepartmentUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Department)).ctor();
                this.FeatureInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Feature)).ctor();
                this.FreightBalance = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightBalance)).ctor();
                this.FreightBalanceUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightBalance)).ctor();
                this.FreightHistoryInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightHistory)).ctor();
                this.FreightHistoryUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightHistory)).ctor();
                this.FreightProofInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightProof)).ctor();
                this.FreightProofUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightProof)).ctor();
                this.FreightStateInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightState)).ctor();
                this.FreightStateUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.FreightState)).ctor();
                this.GroupRoleInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.GroupRole)).ctor();
                this.GroupRoleUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.GroupRole)).ctor();
                this.MaintenanceTicketAssignee = new (System.Collections.Generic.HashSet$1(LogAPI.Models.MaintenanceTicket)).ctor();
                this.MaintenanceTicketInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.MaintenanceTicket)).ctor();
                this.MaintenanceTicketUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.MaintenanceTicket)).ctor();
                this.NationalityInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Nationality)).ctor();
                this.Order = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Order)).ctor();
                this.OrderUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Order)).ctor();
                this.OrderDetail = new (System.Collections.Generic.HashSet$1(LogAPI.Models.OrderDetail)).ctor();
                this.OrderDetailUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.OrderDetail)).ctor();
                this.PaymentApprovalConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.PaymentApprovalConfig)).ctor();
                this.PaymentApprovalConfigInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.PaymentApprovalConfig)).ctor();
                this.PaymentApprovalConfigUpdated = new (System.Collections.Generic.HashSet$1(LogAPI.Models.PaymentApprovalConfig)).ctor();
                this.QuotationInsertdBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
                this.QuotationUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
                this.RightByGroupInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.RightByGroup)).ctor();
                this.RightByGroupUpdated = new (System.Collections.Generic.HashSet$1(LogAPI.Models.RightByGroup)).ctor();
                this.RightByRoleInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.RightByRole)).ctor();
                this.RightByRoleUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.RightByRole)).ctor();
                this.RightByUserUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.RightByUser)).ctor();
                this.UserRight = new (System.Collections.Generic.HashSet$1(LogAPI.Models.RightByUser)).ctor();
                this.RightByUserInserted = new (System.Collections.Generic.HashSet$1(LogAPI.Models.RightByUser)).ctor();
                this.SurchargeInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Surcharge)).ctor();
                this.TerminalUpdated = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Terminal)).ctor();
                this.TicketStateInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TicketState)).ctor();
                this.TicketStateUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TicketState)).ctor();
                this.TimeboxInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Timebox)).ctor();
                this.TimeboxUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Timebox)).ctor();
                this.TruckMaintenanceAccountable = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMaintenance)).ctor();
                this.TruckMaintenanceInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMaintenance)).ctor();
                this.TruckMaintenanceUpdatedBY = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMaintenance)).ctor();
                this.TruckMaintenanceDetailInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMaintenanceDetail)).ctor();
                this.TruckMaintenanceDetailUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMaintenanceDetail)).ctor();
                this.TruckMonitorConfig = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMonitorConfig)).ctor();
                this.TruckMonitorConfigInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMonitorConfig)).ctor();
                this.TruckMonitorConfigUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMonitorConfig)).ctor();
                this.UserInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.User)).ctor();
                this.UserUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.User)).ctor();
                this.UserBalance = new (System.Collections.Generic.HashSet$1(LogAPI.Models.UserBalance)).ctor();
                this.UserBalanceInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.UserBalance)).ctor();
                this.UserBalanceUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.UserBalance)).ctor();
                this.VendorTypeInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.VendorType)).ctor();
                this.VendorTypeUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.VendorType)).ctor();
                this.VolumeRangeInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.VolumeRange)).ctor();
                this.VolumeRangeUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.VolumeRange)).ctor();
                this.WeightRangeInsertedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.WeightRange)).ctor();
                this.WeightRangeUpdatedBy = new (System.Collections.Generic.HashSet$1(LogAPI.Models.WeightRange)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.UserBalance", {
        fields: {
            Id: 0,
            UserId: 0,
            Debit: null,
            Credit: null,
            Currency: null,
            HasInvoice: 0,
            InvoiceImage: null,
            PaymentObjectiveId: 0,
            ShouldCountToSalary: false,
            CoordinatorId: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Coordination: null,
            Objective: null,
            User: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            }
        }
    });

    Bridge.define("LogAPI.Models.Vendor", {
        fields: {
            Id: 0,
            Name: null,
            VendorTypeId: 0,
            Description: null,
            PhoneNumber: null,
            PhoneNumber2: null,
            Address: null,
            Address2: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Accessory: null,
            Container: null,
            OrderDetail: null,
            Quotation: null,
            TruckMaintenance: null,
            VendorType: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Accessory = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Accessory)).ctor();
                this.Container = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Container)).ctor();
                this.OrderDetail = new (System.Collections.Generic.HashSet$1(LogAPI.Models.OrderDetail)).ctor();
                this.Quotation = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
                this.TruckMaintenance = new (System.Collections.Generic.HashSet$1(LogAPI.Models.TruckMaintenance)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.VendorType", {
        fields: {
            Id: 0,
            Name: null,
            Description: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            UserInserted: null,
            UserUpdated: null,
            Vendor: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Vendor = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Vendor)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.VolumeRange", {
        fields: {
            Id: 0,
            VolumeStart: 0,
            VolumeEnd: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Quotation: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Quotation = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
            }
        }
    });

    Bridge.define("LogAPI.Models.WeightRange", {
        fields: {
            Id: 0,
            WeightStart: 0,
            WeightEnd: null,
            Active: false,
            InsertedDate: null,
            InsertedBy: 0,
            UpdatedDate: null,
            UpdatedBy: null,
            Quotation: null,
            UserInserted: null,
            UserUpdated: null
        },
        ctors: {
            init: function () {
                this.InsertedDate = System.DateTime.getDefaultValue();
            },
            ctor: function () {
                this.$initialize();
                this.Quotation = new (System.Collections.Generic.HashSet$1(LogAPI.Models.Quotation)).ctor();
            }
        }
    });

    Bridge.define("Common.Interfaces.BaseClient$1", function (T) { return {
        inherits: [Common.Interfaces.IRestful$1(T)],
        fields: {
            BaseUrl: null
        },
        alias: [
            "GetList", "Common$Interfaces$IRestful$1$" + Bridge.getTypeAlias(T) + "$GetList",
            "Get", "Common$Interfaces$IRestful$1$" + Bridge.getTypeAlias(T) + "$Get",
            "PostAsync", "Common$Interfaces$IRestful$1$" + Bridge.getTypeAlias(T) + "$PostAsync",
            "PutAsync", "Common$Interfaces$IRestful$1$" + Bridge.getTypeAlias(T) + "$PutAsync",
            "Delete", "Common$Interfaces$IRestful$1$" + Bridge.getTypeAlias(T) + "$Delete"
        ],
        ctors: {
            ctor: function () {
                this.$initialize();
            },
            $ctor1: function (url) {
                this.$initialize();
                this.BaseUrl = url;
            }
        },
        methods: {
            GetList: function () {
                var $step = 0,
                    $task1, 
                    $taskResult1, 
                    $jumpFromFinally, 
                    $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                    $returnValue, 
                    type, 
                    tcs, 
                    xhr, 
                    $async_e, 
                    $asyncBody = Bridge.fn.bind(this, function () {
                        try {
                            for (;;) {
                                $step = System.Array.min([0,1], $step);
                                switch ($step) {
                                    case 0: {
                                        type = T;
                                        tcs = new System.Threading.Tasks.TaskCompletionSource();
                                        xhr = new XMLHttpRequest();
                                        xhr.open("GET", System.String.format("{0}/api/{1}", this.BaseUrl, Bridge.Reflection.getTypeName(type)), true);
                                        xhr.onreadystatechange = function () {
                                            if (xhr.readyState !== 4) {
                                                return;
                                            }

                                            if (xhr.status === 200 || xhr.status === 204) {
                                                var parsed = Newtonsoft.Json.JsonConvert.DeserializeObject(xhr.responseText, System.Collections.Generic.List$1(T));
                                                tcs.setResult(parsed);
                                            } else {
                                                tcs.setException(new System.Exception("Response status code does not indicate success: " + (xhr.statusText || "")));
                                            }
                                        };
                                        xhr.send();
                                        $task1 = tcs.task;
                                        $step = 1;
                                        if ($task1.isCompleted()) {
                                            continue;
                                        }
                                        $task1.continue($asyncBody);
                                        return;
                                    }
                                    case 1: {
                                        $taskResult1 = $task1.getAwaitedResult();
                                        $tcs.setResult($taskResult1);
                                        return;
                                    }
                                    default: {
                                        $tcs.setResult(null);
                                        return;
                                    }
                                }
                            }
                        } catch($async_e1) {
                            $async_e = System.Exception.create($async_e1);
                            $tcs.setException($async_e);
                        }
                    }, arguments);

                $asyncBody();
                return $tcs.task;
            },
            Get: function (id) {
                var $step = 0,
                    $task1, 
                    $taskResult1, 
                    $jumpFromFinally, 
                    $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                    $returnValue, 
                    type, 
                    tcs, 
                    xhr, 
                    $async_e, 
                    $asyncBody = Bridge.fn.bind(this, function () {
                        try {
                            for (;;) {
                                $step = System.Array.min([0,1], $step);
                                switch ($step) {
                                    case 0: {
                                        type = T;
                                        tcs = new System.Threading.Tasks.TaskCompletionSource();
                                        xhr = new XMLHttpRequest();
                                        xhr.open("GET", System.String.format("{0}/api/{1}/{2}", this.BaseUrl, Bridge.Reflection.getTypeName(type), Bridge.box(id, System.Int32)), true);
                                        xhr.onreadystatechange = function () {
                                            if (xhr.readyState !== 4) {
                                                return;
                                            }

                                            if (xhr.status === 200 || xhr.status === 204) {
                                                var parsed = Newtonsoft.Json.JsonConvert.DeserializeObject(xhr.responseText, T);
                                                tcs.setResult(parsed);
                                            } else {
                                                tcs.setException(new System.Exception("Response status code does not indicate success: " + (xhr.statusText || "")));
                                            }
                                        };
                                        xhr.send();
                                        $task1 = tcs.task;
                                        $step = 1;
                                        if ($task1.isCompleted()) {
                                            continue;
                                        }
                                        $task1.continue($asyncBody);
                                        return;
                                    }
                                    case 1: {
                                        $taskResult1 = $task1.getAwaitedResult();
                                        $tcs.setResult($taskResult1);
                                        return;
                                    }
                                    default: {
                                        $tcs.setResult(null);
                                        return;
                                    }
                                }
                            }
                        } catch($async_e1) {
                            $async_e = System.Exception.create($async_e1);
                            $tcs.setException($async_e);
                        }
                    }, arguments);

                $asyncBody();
                return $tcs.task;
            },
            PostAsync: function (value) {
                var $step = 0,
                    $task1, 
                    $taskResult1, 
                    $jumpFromFinally, 
                    $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                    $returnValue, 
                    type, 
                    tcs, 
                    xhr, 
                    $async_e, 
                    $asyncBody = Bridge.fn.bind(this, function () {
                        try {
                            for (;;) {
                                $step = System.Array.min([0,1], $step);
                                switch ($step) {
                                    case 0: {
                                        type = T;
                                        tcs = new System.Threading.Tasks.TaskCompletionSource();
                                        xhr = new XMLHttpRequest();
                                        xhr.open("POST", System.String.format("{0}/api/{1}", this.BaseUrl, Bridge.Reflection.getTypeName(type)), true);
                                        xhr.setRequestHeader("Content-type", "application/json-patch+json");
                                        xhr.onreadystatechange = function () {
                                            if (xhr.readyState !== 4) {
                                                return;
                                            }

                                            if (xhr.status === 200 || xhr.status === 204) {
                                                var parsed = Newtonsoft.Json.JsonConvert.DeserializeObject(xhr.responseText, T);
                                                tcs.setResult(parsed);
                                            } else {
                                                tcs.setException(new System.Exception("Response status code does not indicate success: " + (xhr.statusText || "")));
                                            }
                                        };
                                        xhr.send(Newtonsoft.Json.JsonConvert.SerializeObject(value));
                                        $task1 = tcs.task;
                                        $step = 1;
                                        if ($task1.isCompleted()) {
                                            continue;
                                        }
                                        $task1.continue($asyncBody);
                                        return;
                                    }
                                    case 1: {
                                        $taskResult1 = $task1.getAwaitedResult();
                                        $tcs.setResult($taskResult1);
                                        return;
                                    }
                                    default: {
                                        $tcs.setResult(null);
                                        return;
                                    }
                                }
                            }
                        } catch($async_e1) {
                            $async_e = System.Exception.create($async_e1);
                            $tcs.setException($async_e);
                        }
                    }, arguments);

                $asyncBody();
                return $tcs.task;
            },
            PutAsync: function (value) {
                var $step = 0,
                    $task1, 
                    $taskResult1, 
                    $jumpFromFinally, 
                    $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                    $returnValue, 
                    type, 
                    tcs, 
                    xhr, 
                    $async_e, 
                    $asyncBody = Bridge.fn.bind(this, function () {
                        try {
                            for (;;) {
                                $step = System.Array.min([0,1], $step);
                                switch ($step) {
                                    case 0: {
                                        type = T;
                                        tcs = new System.Threading.Tasks.TaskCompletionSource();
                                        xhr = new XMLHttpRequest();
                                        xhr.open("PUT", System.String.format("{0}/api/{1}", this.BaseUrl, Bridge.Reflection.getTypeName(type)), true);
                                        xhr.setRequestHeader("Content-type", "application/json-patch+json");
                                        xhr.onreadystatechange = function () {
                                            if (xhr.readyState !== 4) {
                                                return;
                                            }

                                            if (xhr.status === 200 || xhr.status === 204) {
                                                var parsed = Newtonsoft.Json.JsonConvert.DeserializeObject(xhr.responseText, T);
                                                tcs.setResult(parsed);
                                            } else {
                                                tcs.setException(new System.Exception("Response status code does not indicate success: " + (xhr.statusText || "")));
                                            }
                                        };
                                        xhr.send(Newtonsoft.Json.JsonConvert.SerializeObject(value));
                                        $task1 = tcs.task;
                                        $step = 1;
                                        if ($task1.isCompleted()) {
                                            continue;
                                        }
                                        $task1.continue($asyncBody);
                                        return;
                                    }
                                    case 1: {
                                        $taskResult1 = $task1.getAwaitedResult();
                                        $tcs.setResult($taskResult1);
                                        return;
                                    }
                                    default: {
                                        $tcs.setResult(null);
                                        return;
                                    }
                                }
                            }
                        } catch($async_e1) {
                            $async_e = System.Exception.create($async_e1);
                            $tcs.setException($async_e);
                        }
                    }, arguments);

                $asyncBody();
                return $tcs.task;
            },
            Delete: function (id) {
                var $step = 0,
                    $task1, 
                    $taskResult1, 
                    $jumpFromFinally, 
                    $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                    $returnValue, 
                    type, 
                    tcs, 
                    xhr, 
                    $async_e, 
                    $asyncBody = Bridge.fn.bind(this, function () {
                        try {
                            for (;;) {
                                $step = System.Array.min([0,1], $step);
                                switch ($step) {
                                    case 0: {
                                        type = T;
                                        tcs = new System.Threading.Tasks.TaskCompletionSource();
                                        xhr = new XMLHttpRequest();
                                        xhr.open("DELETE", System.String.format("{0}/api/{1}/{2}", this.BaseUrl, Bridge.Reflection.getTypeName(type), Bridge.box(id, System.Int32)), true);
                                        xhr.setRequestHeader("Content-type", "application/json");
                                        xhr.onreadystatechange = function () {
                                            if (xhr.readyState !== 4) {
                                                return;
                                            }
                                            if (xhr.status === 200 || xhr.status === 204) {
                                                var parsed = Newtonsoft.Json.JsonConvert.DeserializeObject(xhr.responseText, System.Boolean);
                                                tcs.setResult(parsed);
                                            } else {
                                                tcs.setException(new System.Exception("Response status code does not indicate success: " + (xhr.statusText || "")));
                                            }
                                        };
                                        xhr.send();
                                        $task1 = tcs.task;
                                        $step = 1;
                                        if ($task1.isCompleted()) {
                                            continue;
                                        }
                                        $task1.continue($asyncBody);
                                        return;
                                    }
                                    case 1: {
                                        $taskResult1 = $task1.getAwaitedResult();
                                        $tcs.setResult($taskResult1);
                                        return;
                                    }
                                    default: {
                                        $tcs.setResult(null);
                                        return;
                                    }
                                }
                            }
                        } catch($async_e1) {
                            $async_e = System.Exception.create($async_e1);
                            $tcs.setException($async_e);
                        }
                    }, arguments);

                $asyncBody();
                return $tcs.task;
            }
        }
    }; });
});
