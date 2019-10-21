insert into Field (EntityId, FieldName, ColumnType, AllowNull, Active, InsertedDate, InsertedBy)

select Entity.Id as EntityId,
	col.name as FieldName,
	case 
		when ctype.name = 'nvarchar' then N'nvarchar(' + CONVERT(varchar, col.max_length) + ')'
		when ctype.name = 'varchar' then N'varchar(' + CONVERT(varchar, col.max_length) + ')'
		else convert(nvarchar, ctype.name)
	end as ColumnType,
	col.is_nullable as AllowNull, 1, GETDATE(), 1
	--pk_tab.name as RefTable, pk_col.name as RefField
from sys.tables tab
	inner join Entity on tab.Name = Entity.Name
	inner join sys.columns col on col.object_id = tab.object_id
	inner join sys.types ctype on ctype.user_type_id = col.user_type_id
	left join sys.foreign_key_columns fk_cols
		on fk_cols.parent_object_id = tab.object_id
		and fk_cols.parent_column_id = col.column_id
	left join sys.foreign_keys fk
		on fk.object_id = fk_cols.constraint_object_id
	left join sys.tables pk_tab
		on pk_tab.object_id = fk_cols.referenced_object_id
	left join sys.columns pk_col
		on pk_col.column_id = fk_cols.referenced_column_id
		and pk_col.object_id = fk_cols.referenced_object_id
order by tab.name, col.column_id
