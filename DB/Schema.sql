ALTER TABLE [dbo].[Workflow] DROP CONSTRAINT [FK_Workflow_UserUpdated]
GO
ALTER TABLE [dbo].[Workflow] DROP CONSTRAINT [FK_Workflow_UserInserted]
GO
ALTER TABLE [dbo].[WeightRange] DROP CONSTRAINT [FK_WeightRange_UserUpdated]
GO
ALTER TABLE [dbo].[WeightRange] DROP CONSTRAINT [FK_WeightRange_UserInserted]
GO
ALTER TABLE [dbo].[VolumeRange] DROP CONSTRAINT [FK_VolumeRange_UserUpdated]
GO
ALTER TABLE [dbo].[VolumeRange] DROP CONSTRAINT [FK_VolumeRange_UserInserted]
GO
ALTER TABLE [dbo].[VendorType] DROP CONSTRAINT [FK_VendorType_UserUpdated]
GO
ALTER TABLE [dbo].[VendorType] DROP CONSTRAINT [FK_VendorType_UserInserted]
GO
ALTER TABLE [dbo].[Vendor] DROP CONSTRAINT [FK_Vendor_VendorType]
GO
ALTER TABLE [dbo].[UserInterface] DROP CONSTRAINT [FK_UserInterface_UserUpdated]
GO
ALTER TABLE [dbo].[UserInterface] DROP CONSTRAINT [FK_UserInterface_UserInserted]
GO
ALTER TABLE [dbo].[UserInterface] DROP CONSTRAINT [FK_UserInterface_Policy]
GO
ALTER TABLE [dbo].[UserInterface] DROP CONSTRAINT [FK_UserInterface_FreightState]
GO
ALTER TABLE [dbo].[UserInterface] DROP CONSTRAINT [FK_UserInterface_Entity]
GO
ALTER TABLE [dbo].[UserInterface] DROP CONSTRAINT [FK_UserInterface_ComponentGroup]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_UserUpdated]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_UserInserted]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_User_SupervisorId]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Nationality]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Contract]
GO
ALTER TABLE [dbo].[TruckType] DROP CONSTRAINT [FK_TruckType_UserUpdated]
GO
ALTER TABLE [dbo].[TruckType] DROP CONSTRAINT [FK_TruckType_UserInserted]
GO
ALTER TABLE [dbo].[TruckMonitorConfig] DROP CONSTRAINT [FK_TruckMonitorConfig_Policy]
GO
ALTER TABLE [dbo].[TruckMonitorConfig] DROP CONSTRAINT [FK_TruckMonitor_UserUpdated]
GO
ALTER TABLE [dbo].[TruckMonitorConfig] DROP CONSTRAINT [FK_TruckMonitor_UserInserted]
GO
ALTER TABLE [dbo].[TruckMonitorConfig] DROP CONSTRAINT [FK_TruckMonitor_Truck]
GO
ALTER TABLE [dbo].[TruckMonitorConfig] DROP CONSTRAINT [FK_TruckMonitor_Accessory]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] DROP CONSTRAINT [FK_MaintenanceDetail_UserUpdated]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] DROP CONSTRAINT [FK_MaintenanceDetail_UserInserted]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] DROP CONSTRAINT [FK_MaintenanceDetail_Maintenance]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] DROP CONSTRAINT [FK_MaintenanceDetail_Accessory]
GO
ALTER TABLE [dbo].[TruckMaintenance] DROP CONSTRAINT [FK_TruckMaintenance_Vendor]
GO
ALTER TABLE [dbo].[TruckMaintenance] DROP CONSTRAINT [FK_TruckMaintenance_UserUpdated]
GO
ALTER TABLE [dbo].[TruckMaintenance] DROP CONSTRAINT [FK_TruckMaintenance_UserInserted]
GO
ALTER TABLE [dbo].[TruckMaintenance] DROP CONSTRAINT [FK_TruckMaintenance_UserAccountable]
GO
ALTER TABLE [dbo].[TruckMaintenance] DROP CONSTRAINT [FK_TruckMaintenance_TruckMaintenance]
GO
ALTER TABLE [dbo].[TruckMaintenance] DROP CONSTRAINT [FK_TruckMaintenance_Truck]
GO
ALTER TABLE [dbo].[TruckMaintenance] DROP CONSTRAINT [FK_TruckMaintenance_MaintenanceTicket]
GO
ALTER TABLE [dbo].[TruckMaintenance] DROP CONSTRAINT [FK_TruckMaintenance_Currency]
GO
ALTER TABLE [dbo].[Truck] DROP CONSTRAINT [FK_Truck_TruckType]
GO
ALTER TABLE [dbo].[Truck] DROP CONSTRAINT [FK_Truck_FuelType]
GO
ALTER TABLE [dbo].[Truck] DROP CONSTRAINT [FK_Truck_Currency]
GO
ALTER TABLE [dbo].[TransitionAction] DROP CONSTRAINT [FK_TransitionAction_Transition]
GO
ALTER TABLE [dbo].[TransitionAction] DROP CONSTRAINT [FK_TransitionAction_Action]
GO
ALTER TABLE [dbo].[Transition] DROP CONSTRAINT [FK_Transition_Workflow]
GO
ALTER TABLE [dbo].[Transition] DROP CONSTRAINT [FK_Transition_UserUpdated]
GO
ALTER TABLE [dbo].[Transition] DROP CONSTRAINT [FK_Transition_UserInserted]
GO
ALTER TABLE [dbo].[Transition] DROP CONSTRAINT [FK_Transition_FreightStateNext]
GO
ALTER TABLE [dbo].[Transition] DROP CONSTRAINT [FK_Transition_FreightStateCurrent]
GO
ALTER TABLE [dbo].[Timebox] DROP CONSTRAINT [FK_Timebox_UserUpdated]
GO
ALTER TABLE [dbo].[Timebox] DROP CONSTRAINT [FK_Timebox_UserInserted]
GO
ALTER TABLE [dbo].[TicketState] DROP CONSTRAINT [FK_TicketState_UserUpdated]
GO
ALTER TABLE [dbo].[TicketState] DROP CONSTRAINT [FK_TicketState_UserInserted]
GO
ALTER TABLE [dbo].[Terminal] DROP CONSTRAINT [FK_Terminal_UserUpdated]
GO
ALTER TABLE [dbo].[Terminal] DROP CONSTRAINT [FK_Terminal_UserInserted]
GO
ALTER TABLE [dbo].[Terminal] DROP CONSTRAINT [FK_Terminal_Nationality]
GO
ALTER TABLE [dbo].[Surcharge] DROP CONSTRAINT [FK_Surcharge_UserUpdated]
GO
ALTER TABLE [dbo].[Surcharge] DROP CONSTRAINT [FK_Surcharge_UserInserted]
GO
ALTER TABLE [dbo].[Surcharge] DROP CONSTRAINT [FK_Surcharge_OrderDetail]
GO
ALTER TABLE [dbo].[StatePolicy] DROP CONSTRAINT [FK_StatePolicy_UserUpdated]
GO
ALTER TABLE [dbo].[StatePolicy] DROP CONSTRAINT [FK_StatePolicy_UserInserted]
GO
ALTER TABLE [dbo].[StatePolicy] DROP CONSTRAINT [FK_StatePolicy_State]
GO
ALTER TABLE [dbo].[StatePolicy] DROP CONSTRAINT [FK_StatePolicy_Policy]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_WeightRange]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_VolumeRange]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_Vendor]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_UserUpdated]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_UserInserted]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_Timebox]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_TerminalTo]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_TerminalFrom]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_CustomerGroup]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_Customer]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_ContainerType]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [FK_Quotation_CommodityType]
GO
ALTER TABLE [dbo].[PaymentPolicy] DROP CONSTRAINT [FK_PaymentPolicy_Policy]
GO
ALTER TABLE [dbo].[PaymentPolicy] DROP CONSTRAINT [FK_ApprovalConfig_UserUpdated]
GO
ALTER TABLE [dbo].[PaymentPolicy] DROP CONSTRAINT [FK_ApprovalConfig_UserInserted]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Vendor]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_UserUpdated]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_UserInserted]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Timebox]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Quotation]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_CommodityType]
GO
ALTER TABLE [dbo].[OrderComposition] DROP CONSTRAINT [FK_OrderComposition_OrderDetail]
GO
ALTER TABLE [dbo].[OrderComposition] DROP CONSTRAINT [FK_OrderComposition_Coordination]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_UserUpdated]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_UserInserted]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_TerminalTo]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_TerminalFrom]
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Nationality] DROP CONSTRAINT [FK_Nationality_UserUpdated]
GO
ALTER TABLE [dbo].[Nationality] DROP CONSTRAINT [FK_Nationality_UserInserted]
GO
ALTER TABLE [dbo].[MaintenanceTicket] DROP CONSTRAINT [FK_MaintenanceTicket_UserUpdated]
GO
ALTER TABLE [dbo].[MaintenanceTicket] DROP CONSTRAINT [FK_MaintenanceTicket_UserInserted]
GO
ALTER TABLE [dbo].[MaintenanceTicket] DROP CONSTRAINT [FK_MaintenanceTicket_Truck]
GO
ALTER TABLE [dbo].[MaintenanceTicket] DROP CONSTRAINT [FK_MaintenanceTicket_TicketState]
GO
ALTER TABLE [dbo].[MaintenanceTicket] DROP CONSTRAINT [FK_MaintenanceTicket_Role]
GO
ALTER TABLE [dbo].[MaintenanceTicket] DROP CONSTRAINT [FK_MaintenanceTicket_GroupRole]
GO
ALTER TABLE [dbo].[MaintenanceTicket] DROP CONSTRAINT [FK_MaintenanceTicket_Container]
GO
ALTER TABLE [dbo].[MaintenanceTicket] DROP CONSTRAINT [FK_MaintenanceTicket_Assignee]
GO
ALTER TABLE [dbo].[MaintenanceTicket] DROP CONSTRAINT [FK_MaintenanceTicket_Accessory]
GO
ALTER TABLE [dbo].[Ledger] DROP CONSTRAINT [FK_Ledger_UserUpdated]
GO
ALTER TABLE [dbo].[Ledger] DROP CONSTRAINT [FK_Ledger_UserInserted]
GO
ALTER TABLE [dbo].[Ledger] DROP CONSTRAINT [FK_Ledger_UserApprover]
GO
ALTER TABLE [dbo].[Ledger] DROP CONSTRAINT [FK_Ledger_OperationType]
GO
ALTER TABLE [dbo].[Ledger] DROP CONSTRAINT [FK_Ledger_Objective]
GO
ALTER TABLE [dbo].[Ledger] DROP CONSTRAINT [FK_Ledger_Entity]
GO
ALTER TABLE [dbo].[Ledger] DROP CONSTRAINT [FK_Ledger_Currency]
GO
ALTER TABLE [dbo].[GroupRole] DROP CONSTRAINT [FK_GroupRole_UserUpdated]
GO
ALTER TABLE [dbo].[GroupRole] DROP CONSTRAINT [FK_GroupRole_UserInserted]
GO
ALTER TABLE [dbo].[GroupMember] DROP CONSTRAINT [FK_GroupMember_User_UpdatedBy]
GO
ALTER TABLE [dbo].[GroupMember] DROP CONSTRAINT [FK_GroupMember_User_InsertedBy]
GO
ALTER TABLE [dbo].[GroupMember] DROP CONSTRAINT [FK_GroupMember_Role_RoleId]
GO
ALTER TABLE [dbo].[GroupMember] DROP CONSTRAINT [FK_GroupMember_GroupRole_GroupRoleId]
GO
ALTER TABLE [dbo].[GridPolicy] DROP CONSTRAINT [FK_GridPolicy_UserUpdated]
GO
ALTER TABLE [dbo].[GridPolicy] DROP CONSTRAINT [FK_GridPolicy_UserInserted]
GO
ALTER TABLE [dbo].[GridPolicy] DROP CONSTRAINT [FK_GridPolicy_RefEntity]
GO
ALTER TABLE [dbo].[GridPolicy] DROP CONSTRAINT [FK_GridPolicy_Policy]
GO
ALTER TABLE [dbo].[GridPolicy] DROP CONSTRAINT [FK_GridPolicy_FreightState]
GO
ALTER TABLE [dbo].[GridPolicy] DROP CONSTRAINT [FK_GridPolicy_Feature]
GO
ALTER TABLE [dbo].[GridPolicy] DROP CONSTRAINT [FK_GridPolicy_Entity]
GO
ALTER TABLE [dbo].[FuelType] DROP CONSTRAINT [FK_FuelType_UserUpdated]
GO
ALTER TABLE [dbo].[FuelType] DROP CONSTRAINT [FK_FuelType_UserInserted]
GO
ALTER TABLE [dbo].[FreightState] DROP CONSTRAINT [FK_FreightState_Workflow]
GO
ALTER TABLE [dbo].[FreightState] DROP CONSTRAINT [FK_FreightState_UserUpdated]
GO
ALTER TABLE [dbo].[FreightState] DROP CONSTRAINT [FK_FreightState_UserInserted]
GO
ALTER TABLE [dbo].[FreightProof] DROP CONSTRAINT [FK_FreightProof_UserUpdated]
GO
ALTER TABLE [dbo].[FreightProof] DROP CONSTRAINT [FK_FreightProof_UserInserted]
GO
ALTER TABLE [dbo].[FreightProof] DROP CONSTRAINT [FK_FreightProof_FreightHistory]
GO
ALTER TABLE [dbo].[FreightHistory] DROP CONSTRAINT [FK_FreightHistory_UserUpdated]
GO
ALTER TABLE [dbo].[FreightHistory] DROP CONSTRAINT [FK_FreightHistory_UserInserted]
GO
ALTER TABLE [dbo].[FreightHistory] DROP CONSTRAINT [FK_FreightHistory_UserActor]
GO
ALTER TABLE [dbo].[FreightHistory] DROP CONSTRAINT [FK_FreightHistory_FreightState]
GO
ALTER TABLE [dbo].[FreightHistory] DROP CONSTRAINT [FK_FreightHistory_Coordination]
GO
ALTER TABLE [dbo].[FreightHistory] DROP CONSTRAINT [FK_FreightHistory_Action]
GO
ALTER TABLE [dbo].[FeaturePolicy] DROP CONSTRAINT [FK_FeaturePolicy_UserUpdated]
GO
ALTER TABLE [dbo].[FeaturePolicy] DROP CONSTRAINT [FK_FeaturePolicy_UserInserted]
GO
ALTER TABLE [dbo].[FeaturePolicy] DROP CONSTRAINT [FK_FeaturePolicy_Policy]
GO
ALTER TABLE [dbo].[FeaturePolicy] DROP CONSTRAINT [FK_FeaturePolicy_Feature]
GO
ALTER TABLE [dbo].[Feature] DROP CONSTRAINT [FK_Feature_UserInserted]
GO
ALTER TABLE [dbo].[Feature] DROP CONSTRAINT [FK_Feature_Parent]
GO
ALTER TABLE [dbo].[EntityPolicy] DROP CONSTRAINT [FK_EntityPolicy_UserUpdated]
GO
ALTER TABLE [dbo].[EntityPolicy] DROP CONSTRAINT [FK_EntityPolicy_UserInserted]
GO
ALTER TABLE [dbo].[EntityPolicy] DROP CONSTRAINT [FK_EntityPolicy_Policy]
GO
ALTER TABLE [dbo].[EntityPolicy] DROP CONSTRAINT [FK_EntityPolicy_Entity]
GO
ALTER TABLE [dbo].[Entity] DROP CONSTRAINT [FK_Entity_UserUpdated]
GO
ALTER TABLE [dbo].[Entity] DROP CONSTRAINT [FK_Entity_UserInserted]
GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [FK_Department_UserUpdated]
GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [FK_Department_UserInserted]
GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [FK_Department_Leader]
GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_Customer_UserUpdated]
GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_Customer_UserInserted]
GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_Customer_Nationality]
GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_Customer_CustomerGroup]
GO
ALTER TABLE [dbo].[Currency] DROP CONSTRAINT [FK_Currency_UserUpdated]
GO
ALTER TABLE [dbo].[Currency] DROP CONSTRAINT [FK_Currency_UserInserted]
GO
ALTER TABLE [dbo].[Coordination] DROP CONSTRAINT [FK_Coordination_UserUpdated]
GO
ALTER TABLE [dbo].[Coordination] DROP CONSTRAINT [FK_Coordination_UserInserted]
GO
ALTER TABLE [dbo].[Coordination] DROP CONSTRAINT [FK_Coordination_UserDriver]
GO
ALTER TABLE [dbo].[Coordination] DROP CONSTRAINT [FK_Coordination_Truck]
GO
ALTER TABLE [dbo].[Coordination] DROP CONSTRAINT [FK_Coordination_TerminalTo]
GO
ALTER TABLE [dbo].[Coordination] DROP CONSTRAINT [FK_Coordination_TerminalFrom]
GO
ALTER TABLE [dbo].[Coordination] DROP CONSTRAINT [FK_Coordination_FreightState]
GO
ALTER TABLE [dbo].[Coordination] DROP CONSTRAINT [FK_Coordination_Container]
GO
ALTER TABLE [dbo].[Contract] DROP CONSTRAINT [FK_Contract_UserUpdated]
GO
ALTER TABLE [dbo].[Contract] DROP CONSTRAINT [FK_Contract_UserInserted]
GO
ALTER TABLE [dbo].[Contract] DROP CONSTRAINT [FK_Contract_User]
GO
ALTER TABLE [dbo].[ContainerType] DROP CONSTRAINT [FK_ContainerType_UserUpdated]
GO
ALTER TABLE [dbo].[ContainerType] DROP CONSTRAINT [FK_ContainerType_UserInserted]
GO
ALTER TABLE [dbo].[Container] DROP CONSTRAINT [FK_Container_Vendor]
GO
ALTER TABLE [dbo].[Container] DROP CONSTRAINT [FK_Container_UserUpdated]
GO
ALTER TABLE [dbo].[Container] DROP CONSTRAINT [FK_Container_UserInserted]
GO
ALTER TABLE [dbo].[Container] DROP CONSTRAINT [FK_Container_FreightState]
GO
ALTER TABLE [dbo].[ComponentGroup] DROP CONSTRAINT [FK_ComponentGroup_UserUpdated]
GO
ALTER TABLE [dbo].[ComponentGroup] DROP CONSTRAINT [FK_ComponentGroup_UserInserted]
GO
ALTER TABLE [dbo].[ComponentGroup] DROP CONSTRAINT [FK_ComponentGroup_Policy]
GO
ALTER TABLE [dbo].[ComponentGroup] DROP CONSTRAINT [FK_ComponentGroup_FreightState]
GO
ALTER TABLE [dbo].[ComponentGroup] DROP CONSTRAINT [FK_ComponentGroup_Feature]
GO
ALTER TABLE [dbo].[ComponentGroup] DROP CONSTRAINT [FK_ComponentGroup_ComponentGroup]
GO
ALTER TABLE [dbo].[CommodityType] DROP CONSTRAINT [FK_CommodityType_UserUpdated]
GO
ALTER TABLE [dbo].[CommodityType] DROP CONSTRAINT [FK_CommodityType_UserInserted]
GO
ALTER TABLE [dbo].[ActionPolicy] DROP CONSTRAINT [FK_ActionPolicy_UserInserted]
GO
ALTER TABLE [dbo].[ActionPolicy] DROP CONSTRAINT [FK_ActionPolicy_User]
GO
ALTER TABLE [dbo].[ActionPolicy] DROP CONSTRAINT [FK_ActionPolicy_Policy]
GO
ALTER TABLE [dbo].[ActionPolicy] DROP CONSTRAINT [FK_ActionPolicy_Action]
GO
ALTER TABLE [dbo].[Action] DROP CONSTRAINT [FK_Action_UserUpdated]
GO
ALTER TABLE [dbo].[Action] DROP CONSTRAINT [FK_Action_UserInserted]
GO
ALTER TABLE [dbo].[Accessory] DROP CONSTRAINT [FK_Accessory_UserUpdated]
GO
ALTER TABLE [dbo].[Accessory] DROP CONSTRAINT [FK_Accessory_UserInserted]
GO
ALTER TABLE [dbo].[Accessory] DROP CONSTRAINT [FK_Accessory_Truck]
GO
ALTER TABLE [dbo].[Accessory] DROP CONSTRAINT [FK_Accessary_Vendor]
GO
ALTER TABLE [dbo].[Quotation] DROP CONSTRAINT [DF_Quotation_TotalContainer]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [DF_OrderDetail_Volume]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [DF_OrderDetail_Weight]
GO
ALTER TABLE [dbo].[GridPolicy] DROP CONSTRAINT [DF_GridPolicy_Frozen]
GO
ALTER TABLE [dbo].[Feature] DROP CONSTRAINT [DF_Feature_IsMenu]
GO
ALTER TABLE [dbo].[Contract] DROP CONSTRAINT [DF_Contract_Allowance]
GO
ALTER TABLE [dbo].[Container] DROP CONSTRAINT [DF_Container_IsMaintained]
GO
ALTER TABLE [dbo].[ComponentGroup] DROP CONSTRAINT [DF_UIGroup_IsTab]
GO
/****** Object:  Table [dbo].[Workflow]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Workflow]
GO
/****** Object:  Table [dbo].[WeightRange]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[WeightRange]
GO
/****** Object:  Table [dbo].[VolumeRange]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[VolumeRange]
GO
/****** Object:  Table [dbo].[VendorType]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[VendorType]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Vendor]
GO
/****** Object:  Table [dbo].[UserInterface]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[UserInterface]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[TruckType]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[TruckType]
GO
/****** Object:  Table [dbo].[TruckMonitorConfig]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[TruckMonitorConfig]
GO
/****** Object:  Table [dbo].[TruckMaintenanceDetail]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[TruckMaintenanceDetail]
GO
/****** Object:  Table [dbo].[TruckMaintenance]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[TruckMaintenance]
GO
/****** Object:  Table [dbo].[Truck]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Truck]
GO
/****** Object:  Table [dbo].[TransitionAction]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[TransitionAction]
GO
/****** Object:  Table [dbo].[Transition]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Transition]
GO
/****** Object:  Table [dbo].[Timebox]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Timebox]
GO
/****** Object:  Table [dbo].[TicketState]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[TicketState]
GO
/****** Object:  Table [dbo].[Terminal]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Terminal]
GO
/****** Object:  Table [dbo].[Surcharge]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Surcharge]
GO
/****** Object:  Table [dbo].[StatePolicy]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[StatePolicy]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Quotation]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Policy]
GO
/****** Object:  Table [dbo].[PaymentPolicy]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[PaymentPolicy]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[OrderComposition]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[OrderComposition]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Order]
GO
/****** Object:  Table [dbo].[OperationType]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[OperationType]
GO
/****** Object:  Table [dbo].[Objective]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Objective]
GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Nationality]
GO
/****** Object:  Table [dbo].[MaintenanceTicket]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[MaintenanceTicket]
GO
/****** Object:  Table [dbo].[Ledger]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Ledger]
GO
/****** Object:  Table [dbo].[GroupRole]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[GroupRole]
GO
/****** Object:  Table [dbo].[GroupMember]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[GroupMember]
GO
/****** Object:  Table [dbo].[GridPolicy]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[GridPolicy]
GO
/****** Object:  Table [dbo].[FuelType]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[FuelType]
GO
/****** Object:  Table [dbo].[FreightState]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[FreightState]
GO
/****** Object:  Table [dbo].[FreightProof]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[FreightProof]
GO
/****** Object:  Table [dbo].[FreightHistory]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[FreightHistory]
GO
/****** Object:  Table [dbo].[FeaturePolicy]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[FeaturePolicy]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Feature]
GO
/****** Object:  Table [dbo].[EntityPolicy]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[EntityPolicy]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Entity]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Department]
GO
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[CustomerGroup]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Currency]
GO
/****** Object:  Table [dbo].[Coordination]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Coordination]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Contract]
GO
/****** Object:  Table [dbo].[ContainerType]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[ContainerType]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Container]
GO
/****** Object:  Table [dbo].[ComponentGroup]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[ComponentGroup]
GO
/****** Object:  Table [dbo].[CommodityType]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[CommodityType]
GO
/****** Object:  Table [dbo].[ActionPolicy]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[ActionPolicy]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Action]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP TABLE [dbo].[Accessory]
GO
/****** Object:  Database [TMS]    Script Date: 11/6/2019 1:07:36 AM ******/
DROP DATABASE [TMS]
GO
/****** Object:  Database [TMS]    Script Date: 11/6/2019 1:07:36 AM ******/
CREATE DATABASE [TMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TMS_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TMS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [TMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TMS] SET RECOVERY FULL 
GO
ALTER DATABASE [TMS] SET  MULTI_USER 
GO
ALTER DATABASE [TMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TMS', N'ON'
GO
ALTER DATABASE [TMS] SET QUERY_STORE = OFF
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Version] [nvarchar](100) NOT NULL,
	[VendorId] [int] NOT NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[AssembledDate] [datetime2](7) NOT NULL,
	[ExpiredDate] [datetime2](7) NOT NULL,
	[MaintenancePeriod] [time](7) NOT NULL,
	[NextMaintenanceDate] [datetime2](7) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Accessary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionPolicy]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionPolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_ActionPolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommodityType]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommodityType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_GoodsType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentGroup]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ClassName] [varchar](50) NULL,
	[IsTab] [bit] NOT NULL,
	[TabGroup] [varchar](50) NULL,
	[Width] [varchar](50) NOT NULL,
	[Style] [varchar](200) NULL,
	[Column] [int] NOT NULL,
	[Row] [int] NOT NULL,
	[PolicyId] [int] NULL,
	[StateId] [int] NULL,
	[Hidden] [bit] NOT NULL,
	[ParentId] [int] NULL,
	[Order] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UIGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[ContainerTypeId] [int] NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[FreightStateId] [int] NOT NULL,
	[RentDate] [datetime2](7) NOT NULL,
	[EndRentDate] [datetime2](7) NOT NULL,
	[Price] [float] NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[InUse] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Container] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContainerType]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_ContainerType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Salary] [float] NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Allowance] [float] NOT NULL,
	[Details] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coordination]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordination](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NOT NULL,
	[DriverId] [int] NOT NULL,
	[FromId] [int] NOT NULL,
	[ToId] [int] NOT NULL,
	[Distance] [float] NOT NULL,
	[FreightStateId] [int] NOT NULL,
	[ContainerId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Coordinator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Symbol] [nvarchar](4) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[PhoneNumber2] [varchar](50) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Address2] [nvarchar](200) NULL,
	[NationalityId] [int] NOT NULL,
	[DoB] [datetime2](7) NULL,
	[SSN] [varchar](50) NOT NULL,
	[Passport] [varchar](50) NULL,
	[Avatar] [nvarchar](1000) NULL,
	[CustomerGroupId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LeaderId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityPolicy]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityPolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[EntityId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
	[CanSee] [bit] NOT NULL,
	[CanAdd] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_EntityPolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ShortName] [nvarchar](100) NULL,
	[ParentId] [int] NULL,
	[Icon] [varchar](50) NULL,
	[IsDevider] [bit] NOT NULL,
	[IsGroup] [bit] NOT NULL,
	[IsMenu] [bit] NOT NULL,
	[ViewClass] [varchar](150) NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeaturePolicy]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeaturePolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
	[CanSee] [bit] NOT NULL,
	[CanAdd] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FeaturePolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreightHistory]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CoordinatorId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
	[FreightStateId] [int] NOT NULL,
	[Comment] [nvarchar](1500) NOT NULL,
	[Long] [float] NOT NULL,
	[Lat] [float] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FreightHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreightProof]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightProof](
	[Id] [int] NOT NULL,
	[FreightHistoryId] [int] NOT NULL,
	[Image] [nvarchar](1000) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FreightProof] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreightState]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[WorkflowId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FreightState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuelType]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FuelType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GridPolicy]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GridPolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureId] [int] NULL,
	[EntityId] [int] NOT NULL,
	[FieldName] [varchar](50) NULL,
	[ShortDesc] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NULL,
	[HasFilter] [bit] NOT NULL,
	[ReferenceId] [int] NULL,
	[DataSource] [varchar](500) NULL,
	[RefDisplayField] [varchar](50) NULL,
	[PolicyId] [int] NULL,
	[StateId] [int] NULL,
	[GroupName] [nvarchar](50) NULL,
	[Format] [varchar](50) NULL,
	[TextAlign] [varchar](10) NULL,
	[Hidden] [bit] NOT NULL,
	[EditEvent] [varchar](50) NULL,
	[DeleteEvent] [varchar](50) NULL,
	[Order] [int] NULL,
	[Frozen] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_GridPolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMember]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMember](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupRoleId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_GroupMember] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupRole]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ledger]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ledger](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[CurencyId] [int] NULL,
	[ObjectiveId] [int] NULL,
	[HasInvoice] [bit] NOT NULL,
	[InvoiceImage] [nvarchar](1500) NULL,
	[OperationTypeId] [int] NULL,
	[EntityId] [int] NULL,
	[TargetId] [int] NULL,
	[Approved] [bit] NULL,
	[ApproverId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NULL,
	[InsertedBy] [int] NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Ledger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceTicket]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceTicket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[AccessaryId] [int] NULL,
	[ContainerId] [int] NULL,
	[AssigneeId] [int] NULL,
	[RoleId] [int] NULL,
	[GroupRoleId] [int] NULL,
	[TicketStateId] [int] NOT NULL,
	[HasAction] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_MaintenanceTicket2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Objective]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objective](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_PaymentObjective] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationType]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_OperationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](100) NOT NULL,
	[ContactNumber] [varchar](50) NOT NULL,
	[ContactSSN] [varchar](50) NOT NULL,
	[ContactPassport] [varchar](50) NULL,
	[ContactAddress] [nvarchar](200) NULL,
	[FromId] [int] NOT NULL,
	[ToId] [int] NOT NULL,
	[TotalContainer] [int] NULL,
	[TotalPrice] [float] NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderComposition]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderComposition](
	[CoordinationId] [int] NOT NULL,
	[OrderDetailId] [int] NOT NULL,
 CONSTRAINT [PK_OrderComposition_1] PRIMARY KEY CLUSTERED 
(
	[CoordinationId] ASC,
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[IsContainer] [bit] NOT NULL,
	[ContainerTypeId] [int] NULL,
	[VendorId] [int] NULL,
	[CommodityTypeId] [int] NOT NULL,
	[Weight] [float] NULL,
	[Volume] [float] NULL,
	[TimeboxId] [int] NULL,
	[QuotationId] [int] NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentPolicy]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentPolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PolicyId] [int] NULL,
	[MaxApproval] [float] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_ApprovalConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[IncludeAll] [bit] NULL,
	[IncludedGroupRole] [varchar](max) NULL,
	[IncludedUser] [varchar](max) NULL,
	[ExcludedGroupRole] [varchar](max) NULL,
	[ExcludedUserIds] [varchar](max) NULL,
	[ExcludeAll] [bit] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[CustomerGroupId] [int] NULL,
	[FromId] [int] NOT NULL,
	[ToId] [int] NOT NULL,
	[ContainerTypeId] [int] NULL,
	[IsContainer] [bit] NOT NULL,
	[TotalContainer] [int] NULL,
	[VendorId] [int] NULL,
	[CommodityTypeId] [int] NOT NULL,
	[WeightRangeId] [int] NULL,
	[VolumeRangeId] [int] NULL,
	[TimeboxId] [int] NULL,
	[EffectiveDate] [datetime2](7) NOT NULL,
	[ExpiredDate] [datetime2](7) NOT NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatePolicy]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatePolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_StatePolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surcharge]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surcharge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailId] [int] NOT NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Surcharge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terminal]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terminal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[ShortName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[NationalityId] [int] NOT NULL,
	[Long] [float] NOT NULL,
	[Lat] [float] NOT NULL,
	[ContactNumber] [varchar](50) NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Terminal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketState]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TicketState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timebox]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timebox](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeboxStart] [time](7) NOT NULL,
	[TimeboxEnd] [time](7) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Timebox] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transition]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkflowId] [int] NOT NULL,
	[CurrentStateId] [int] NOT NULL,
	[NextStateId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Transition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransitionAction]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransitionAction](
	[TransitionId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [PK_TransitionAction] PRIMARY KEY CLUSTERED 
(
	[TransitionId] ASC,
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Truck]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truck](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckPlate] [varchar](50) NULL,
	[BrandName] [nvarchar](100) NULL,
	[Model] [nvarchar](50) NULL,
	[Year] [decimal](4, 0) NULL,
	[Color] [nvarchar](50) NULL,
	[Vin] [varchar](50) NULL,
	[TruckTypeId] [int] NULL,
	[FuelTypeId] [int] NULL,
	[KmPerLit] [float] NULL,
	[MaxCapacity] [float] NULL,
	[PlateRenewal] [varchar](50) NULL,
	[DepartmentId] [int] NULL,
	[Note] [nvarchar](1500) NULL,
	[Image] [varchar](1500) NULL,
	[InUse] [bit] NOT NULL,
	[MaxCBM] [float] NULL,
	[VendorId] [int] NULL,
	[Long] [float] NULL,
	[Lat] [float] NULL,
	[DriverId] [int] NULL,
	[Price] [decimal](20, 5) NULL,
	[CurrencyId] [int] NULL,
	[BoughtDate] [datetime2](7) NULL,
	[ActiveDate] [datetime2](7) NULL,
	[ExpiredDate] [datetime2](7) NULL,
	[MaintenanceStart] [datetime2](7) NULL,
	[MaintenanceEnd] [datetime2](7) NULL,
	[NextMaintenanceDate] [datetime2](7) NULL,
	[MaintenancePeriod] [time](7) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Truck] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TruckMaintenance]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMaintenance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[VendorId] [int] NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[AdvancedPaid] [decimal](20, 5) NULL,
	[Paid] [bit] NOT NULL,
	[Total] [float] NULL,
	[CurrencyId] [int] NULL,
	[AccountableUserId] [int] NULL,
	[TicketId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TruckMaintenance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TruckMaintenanceDetail]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMaintenanceDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceId] [int] NULL,
	[AccessaryId] [int] NULL,
	[Detail] [nvarchar](200) NULL,
	[Price] [decimal](20, 5) NULL,
	[CurrencyId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_MaintenanceDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TruckMonitorConfig]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMonitorConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NOT NULL,
	[AccessoryId] [int] NULL,
	[PolicyId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_MaintenanceTicket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TruckType]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TruckType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FullName]  AS (([FirstName]+' ')+[LastName]),
	[DoB] [datetime2](7) NOT NULL,
	[SSN] [varchar](50) NOT NULL,
	[Passport] [varchar](50) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Address2] [nvarchar](200) NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[PhoneNumber2] [varchar](50) NULL,
	[NationalityId] [int] NULL,
	[ContractId] [int] NULL,
	[DepartmentId] [int] NULL,
	[RoleId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
	[SupervisorId] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInterface]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInterface](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [varchar](50) NULL,
	[PolicyId] [int] NULL,
	[StateId] [int] NULL,
	[ComponentType] [varchar](50) NOT NULL,
	[ComponentGroupId] [int] NULL,
	[DataSourceFilter] [varchar](500) NULL,
	[ReferenceId] [int] NULL,
	[Format] [varchar](200) NULL,
	[Column] [int] NULL,
	[Row] [int] NULL,
	[Precision] [int] NULL,
	[Label] [nvarchar](50) NULL,
	[ShowLabel] [bit] NOT NULL,
	[Icon] [varchar](50) NULL,
	[ClassName] [varchar](50) NULL,
	[Style] [varchar](200) NULL,
	[HotKey] [varchar](50) NULL,
	[Renderer] [varchar](200) NULL,
	[Events] [varchar](200) NULL,
	[Disabled] [bit] NOT NULL,
	[Visibility] [bit] NOT NULL,
	[Order] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UserInterface] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[VendorTypeId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[PhoneNumber2] [varchar](50) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Address2] [nvarchar](200) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TruckVendor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorType]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_VendorType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolumeRange]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumeRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VolumeStart] [float] NOT NULL,
	[VolumeEnd] [float] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_VolumeRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeightRange]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeightRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WeightStart] [float] NOT NULL,
	[WeightEnd] [float] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_WeightRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workflow]    Script Date: 11/6/2019 1:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workflow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[EffectiveDate] [datetime2](7) NULL,
	[ExpiredDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Workflow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accessory] ON 

INSERT [dbo].[Accessory] ([Id], [TruckId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 5, N'Tire', N'Kia', 1, CAST(10000000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), CAST(N'23:00:00' AS Time), CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 5, N'Steering wheel', N'Manufactory', 1, CAST(12500000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), CAST(N'23:00:00' AS Time), CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 5, N'Oil cap', N'Manufactory', 1, CAST(5700000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), CAST(N'23:00:00' AS Time), CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 5, N'Tire', N'Kia', 1, CAST(10000000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), CAST(N'23:00:00' AS Time), CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 5, N'Steering wheel', N'Manufactory', 1, CAST(12500000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), CAST(N'23:00:00' AS Time), CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 5, N'Oil cap', N'Manufactory', 1, CAST(5700000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), CAST(N'23:00:00' AS Time), CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 5, N'Tire', N'Kia', 1, CAST(10000000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), CAST(N'23:00:00' AS Time), CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 5, N'Steering wheel', N'Manufactory', 1, CAST(12500000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), CAST(N'23:00:00' AS Time), CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 5, N'Oil cap', N'Manufactory', 1, CAST(5700000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), CAST(N'23:00:00' AS Time), CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Accessory] OFF
SET IDENTITY_INSERT [dbo].[ComponentGroup] ON 

INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 9, N'Truck detail', NULL, 0, NULL, N'60%', NULL, 4, 0, NULL, NULL, 0, 5, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 9, N'Image', NULL, 0, NULL, N'calc(40% - 1rem)', N'margin-left: 1rem;', 1, 0, NULL, NULL, 0, 5, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 9, N'Price', NULL, 0, NULL, N'100%', N'margin-top: 1rem;', 6, 4, NULL, NULL, 0, 5, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 9, N'Maintenance', NULL, 0, NULL, N'100%', N'margin-top: 1rem;', 6, 4, NULL, NULL, 0, 5, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 9, N'Truck info', NULL, 1, NULL, N'100%', N'padding-top: 1rem; border: 0; width: 800px;', 0, 4, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 9, NULL, N'Button', 0, NULL, N'100%', N'border: 0px; margin-top: 0.4rem; padding-bottom: 0; justify-content: center; width: 150px;', 2, 1, NULL, NULL, 0, 5, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 9, N'Accessory', NULL, 1, NULL, N'100%', N'padding-top: 1rem; border: 0;width: 800px;', 0, 0, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 9, NULL, N'Accessory-list', 0, NULL, N'100%', N'border: 0; padding: 0;', 4, 4, NULL, NULL, 0, 13, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, 9, N'Maintenance', NULL, 1, NULL, N'100%', N'padding-top: 1rem; border: 0;width: 800px;', 4, 4, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 9, NULL, N'Accessory-search', 0, NULL, N'100%', N'border: 0; padding:0 ;', 8, 4, NULL, NULL, 0, 13, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 4, NULL, N'TruckList', 0, NULL, N'100%', N'border: 0; padding:0;', 8, 4, NULL, NULL, 0, NULL, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 4, NULL, N'Search-box', 0, NULL, N'45%', N'border: 0; padding:0; min-width: 400px;', 8, 4, NULL, NULL, 0, 17, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, 4, NULL, N'GridView', 0, NULL, N'100%', N'border: 0; padding:0;', 8, 4, NULL, NULL, 0, 17, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ComponentGroup] OFF
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([Id], [UserId], [StartDate], [EndDate], [Salary], [Currency], [Allowance], [Details], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2029-10-07T00:00:00.0000000' AS DateTime2), 1000000000, N'USD', 0, N'admin', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contract] OFF
INSERT [dbo].[Currency] ([Id], [Name], [Symbol], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'USD', N'$', N'United State Dollar', 1, CAST(N'2019-10-25T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Currency] ([Id], [Name], [Symbol], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'VND', N'đ', N'Việt Nam đồng', 1, CAST(N'2019-10-25T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [LeaderId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'IT', 1, N'Information technology', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Entity] ON 

INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Accessory', 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'OrderDetail', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'PaymentPolicy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Policy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Quotation', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Role', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'StatePolicy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Surcharge', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Terminal', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'TicketState', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Timebox', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'Transition', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'TransitionAction', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'Truck', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'TruckMaintenance', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'TruckMaintenanceDetail', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'TruckMonitorConfig', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'TruckType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'User', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'UserInterface', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'Vendor', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'VendorType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, N'VolumeRange', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, N'WeightRange', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, N'Workflow', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, N'Action', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, N'ActionPolicy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, N'CommodityType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, N'ComponentDesc', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, N'Container', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, N'ContainerType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, N'Contract', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, N'Coordination', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, N'Customer', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, N'CustomerGroup', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, N'Department', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, N'Entity', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, N'EntityPolicy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, N'Feature', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, N'FeaturePolicy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, N'Field', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, N'FreightHistory', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, N'FreightProof', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, N'FreightState', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, N'FuelType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, N'GroupMember', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, N'GroupRole', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, N'Ledger', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, N'MaintenanceTicket', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, N'Nationality', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, N'Objective', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, N'OperationType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, N'Order', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, N'OrderComposition', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, N'Currency', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Entity] OFF
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Main', NULL, NULL, NULL, 0, 1, 1, NULL, N'Manage truck detail', 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Dashboard', NULL, NULL, N'mif-home', 0, 0, 1, N'TMS.UI.Business.Dashboard.Dashboard', N'Statistic', 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Asset', NULL, NULL, N'mif-truck', 0, 0, 1, NULL, NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Truck List', NULL, 3, N'mif-truck', 0, 0, 1, N'TMS.UI.Business.TruckManagement.AllTruck', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Accessory', NULL, 3, N'mif-steam2', 0, 0, 1, N'TMS.UI.Business.TruckManagement.AllTruck', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Maintenance', NULL, 3, N'mif-calendar', 0, 0, 1, N'TMS.UI.Business.TruckManagement.AllTruck', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, NULL, NULL, 3, NULL, 1, 0, 1, NULL, NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Container', NULL, 3, N'fa fa-cube', 0, 0, 1, N'TMS.UI.Business.TruckManagement.AllTruck', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Truck Detail', N'Truck Detail', NULL, NULL, 0, 0, 0, NULL, N'Add new or edit truck', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Feature] OFF
SET IDENTITY_INSERT [dbo].[FreightState] ON 

INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Moving', N'Moving with container', 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Idle', N'Idling', 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'In-Order', N'In Order', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'In-Coordination', N'In Coordination', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Ready to transit', N'Driver takes the container to deliver', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'In-Transit', N'Driver in in his wat', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Delivered', N'Delivered', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FreightState] OFF
SET IDENTITY_INSERT [dbo].[FuelType] ON 

INSERT [dbo].[FuelType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Diesel', 1, CAST(N'2019-10-22T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FuelType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Gas', 1, CAST(N'2019-10-22T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FuelType] OFF
SET IDENTITY_INSERT [dbo].[GridPolicy] ON 

INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 9, 1, N'Id', N'Id', N'Id', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 9, 1, N'Name', N'Name', N'Name', 1, NULL, NULL, NULL, 10, NULL, N'Info', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 9, 1, N'Version', N'Version', N'Version', 1, NULL, NULL, NULL, 10, NULL, N'Info', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 9, 1, N'Vendor', N'Vendor', N'Vendor', 1, 21, NULL, N'Name', 10, NULL, N'Info', N'{Name}', NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 9, 1, N'Price', N'Price', N'Price', 1, NULL, NULL, NULL, 10, NULL, N'Price', N'n', NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 9, 1, N'CurrencyId', N'Currency', N'Currency', 1, 56, NULL, N'Name', 10, NULL, N'Price', N'{Name}', NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 9, 1, N'AssembledDate', N'AssembledDate', N'AssembledDate', 1, NULL, NULL, NULL, 10, NULL, N'Maintenance', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 9, 1, N'ExpiredDate', N'ExpiredDate', N'ExpiredDate', 1, NULL, NULL, NULL, 10, NULL, N'Maintenance', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 9, 1, N'NextMaintenanceDate', N'NextMaintenanceDate', N'NextMaintenanceDate', 1, NULL, NULL, NULL, 10, NULL, N'Maintenance', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, NULL, 18, N'Description', N'Description', N'Description', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, NULL, 18, N'Name', N'Name', N'Name', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, NULL, 46, N'Description', N'Id', N'Id', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, NULL, 46, N'Name', N'Name', N'Name', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, NULL, 37, N'Description', N'Id', N'Id', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, NULL, 37, N'Name', N'Name', N'Name', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, NULL, 21, N'Description', N'Id', N'Id', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, NULL, 21, N'Name', N'Name', N'Name', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, NULL, 19, N'Address', N'Address', N'Address', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, 2, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, NULL, 19, N'FullName', N'Full Name', N'Full Name', 0, NULL, NULL, NULL, 10, NULL, NULL, N'{FirstName} {LastName}', NULL, 0, NULL, NULL, 1, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, NULL, 56, N'Id', N'Id', N'Id', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, NULL, 56, N'Name', N'Name', N'Name', 0, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, 4, 14, N'TruckPlate', N'Truck Plate', N'Truck Plate', 1, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, 4, 14, N'BrandName', N'Brand Name', N'Brand Name', 1, NULL, NULL, NULL, 10, NULL, N'Branch', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, 4, 14, N'Model', N'Model', N'Model', 1, NULL, NULL, NULL, 10, NULL, N'Branch', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, 4, 14, N'Year', N'Year', N'Year', 1, NULL, NULL, NULL, 10, NULL, N'Branch', NULL, N'center', 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, 4, 14, N'Color', N'Color', N'Color', 1, NULL, NULL, NULL, 10, NULL, N'Branch', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, 4, 14, N'Vin', N'Vin', N'Vin', 1, NULL, NULL, NULL, 10, NULL, N'Branch', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, 4, 14, N'TruckTypeId', N'Truck Type', N'Truck Type', 1, 18, NULL, N'Name', 10, NULL, N'Spec', N'{Name}', NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, 4, 14, N'FuelTypeId', N'Fuel Type', N'Fuel Type', 1, 46, NULL, N'Name', 10, NULL, N'Spec', N'{Name}', NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, 4, 14, N'KmPerLit', N'Km/Lit', N'Km per Lit', 1, NULL, NULL, NULL, 10, NULL, N'Spec', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, 4, 14, N'MaxCapacity', N'Max Capacity', N'Max Capacity', 1, 21, NULL, N'Name', 10, NULL, N'Spec', N'{Name}', NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, 4, 14, N'PlateRenewal', N'Plate Renewal', N'Plate Renewal', 1, NULL, NULL, NULL, 10, NULL, N'Info', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, 4, 14, N'DepartmentId', N'Department', N'Department', 1, 37, NULL, N'Name', 10, NULL, N'Info', N'{Name}', NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, 4, 14, N'Note', N'Note', N'Note', 1, NULL, NULL, NULL, 10, NULL, N'Info', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, 4, 14, N'Image', N'Image', N'Image', 1, NULL, NULL, NULL, 10, NULL, N'Maintenance', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, 4, 14, N'InUse', N'In Use', N'In Use', 1, NULL, NULL, NULL, 10, NULL, N'Maintenance', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, 4, 14, N'MaxCbm', N'Max CBM', N'Max CBM', 1, NULL, NULL, NULL, 10, NULL, N'Spec', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, 4, 14, N'VendorId', N'Vendor', N'Vendor', 1, 21, NULL, N'Name', 10, NULL, N'Price', N'{Name}', NULL, 0, NULL, NULL, 0, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, 4, 14, N'DriverId', N'Driver', N'Driver', 1, 19, N'$filter=Role/RoleName eq ''Driver''', NULL, 10, NULL, NULL, N'{FirstName} {LastName}', NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, 4, 14, N'Price', N'Price', N'Price', 1, NULL, NULL, NULL, 10, NULL, N'Price', N'{0:n}', NULL, 0, NULL, NULL, 1, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, 4, 14, N'CurrencyId', N'Currency', N'Currency', 1, 56, NULL, N'Name', 10, NULL, N'Price', N'{Name}', N'center', 0, NULL, NULL, 1, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, 4, 14, N'BoughtDate', N'Bought Date', N'Bought Date', 1, NULL, NULL, NULL, 10, NULL, N'Maintenance', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, 4, 14, N'ActiveDate', N'Active Date', N'Active Date', 1, NULL, NULL, NULL, 10, NULL, N'Maintenance', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, 4, 14, N'ExpiredDate', N'Expired Date', N'Expired Date', 1, NULL, NULL, N'Name', 10, NULL, N'Maintenance', N'{Name}', NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, 4, 14, N'MaintenanceStart', N'Maintenance Start', N'Maintenance Start', 1, NULL, NULL, NULL, 10, NULL, N'Maintenance', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, 4, 14, N'MaintenanceEnd', N'Maintenance End', N'Maintenance End', 1, NULL, NULL, N'Name', 10, NULL, N'Maintenance', N'{Name}', NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, 4, 14, N'NextMaintenanceDate', N'NextMaintenance Date', N'NextMaintenance Date', 1, NULL, NULL, NULL, 10, NULL, N'Maintenance', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, 4, 14, N'MaintenancePeriod', N'Maintenance Period', N'Maintenance Period', 1, NULL, NULL, NULL, 10, NULL, N'Maintenance', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [HasFilter], [ReferenceId], [DataSource], [RefDisplayField], [PolicyId], [StateId], [GroupName], [Format], [TextAlign], [Hidden], [EditEvent], [DeleteEvent], [Order], [Frozen], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, 4, 14, N'Active', N'Active', N'Active', 1, NULL, NULL, NULL, 10, NULL, N'Info', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GridPolicy] OFF
SET IDENTITY_INSERT [dbo].[GroupMember] ON 

INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, 3, N'Coordinator', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 1, 4, N'Sale', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 1, 5, N'Accountant', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 1, 6, N'Director', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 2, 2, N'Non-Office', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GroupMember] OFF
SET IDENTITY_INSERT [dbo].[GroupRole] ON 

INSERT [dbo].[GroupRole] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Office', N'Office', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupRole] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'None-office', N'Non office', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupRole] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Admin', N'Admin', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupRole] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'System', N'System', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GroupRole] OFF
SET IDENTITY_INSERT [dbo].[Nationality] ON 

INSERT [dbo].[Nationality] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Vietnamese', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Nationality] OFF
SET IDENTITY_INSERT [dbo].[Policy] ON 

INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'System', NULL, N'[5]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Admin', NULL, N'[4]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Office', NULL, N'[1]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'None-office', NULL, N'[2]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Public', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Policy] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Admin', N'admin', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Driver', N'driver', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Coordinator', N'Coordinator', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Sale', N'Sale', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Accountant', N'Accountant', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Director', N'Director', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Truck] ON 

INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'76K3-0962', N'Toyota', N'7799', CAST(2019 AS Decimal(4, 0)), N'12w', NULL, 1, 1, 123, NULL, NULL, 2, NULL, N'upload/download.jfif', 1, NULL, 2, NULL, NULL, 3, CAST(11.23000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, CAST(N'2019-10-21T19:09:54.5310000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'23K5 - 9220', N'Ford', N'Everest', CAST(2019 AS Decimal(4, 0)), N'White', NULL, 2, 2, 111, NULL, NULL, NULL, NULL, N'upload/download.jfif', 1, NULL, 1, NULL, NULL, 3, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-18T22:37:52.0250000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'23K5 - 7777', N'Hundai', N'16t', CAST(2019 AS Decimal(4, 0)), N'Black', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 3, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-18T22:41:39.7910000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'23K5 - 9999', N'Ford', N'Everest', CAST(2019 AS Decimal(4, 0)), N'VinYel', NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 3, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-06T13:37:49.7520000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'23K5 - 8288', N'Honda', N'16t', CAST(2019 AS Decimal(4, 0)), N'Blackjet', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-07T10:25:28.1030000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'23K5 - 8288', N'Ford', N'Everest', CAST(2019 AS Decimal(4, 0)), N'Gold', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-06T13:37:49.7520000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'23K5 - 8288', N'Honda', N'16t', CAST(2019 AS Decimal(4, 0)), N'Silver', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, 10.00923, 11.292888, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'23:30:00' AS Time), 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'23K5 - 8288', N'Honda', N'16t', CAST(2019 AS Decimal(4, 0)), N'Blackjet', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-07T10:25:28.1030000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'23K5 - 7122', N'Ford', N'Everest', CAST(2019 AS Decimal(4, 0)), N'Gold', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-06T13:37:49.7520000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'23K5 - 8288', N'Honda', N'16t', CAST(2019 AS Decimal(4, 0)), N'Silver', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, 10.00923, 11.292888, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'23:30:00' AS Time), 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'asd-123', N'Toyota', N'7777', CAST(2019 AS Decimal(4, 0)), NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 2, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-21T19:09:54.5310000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'Test update', N'123', N'123', CAST(123 AS Decimal(4, 0)), N'123', N'123', 1, 1, 123, 123, N'123', 2, N'123', N'upload/black-delivery-small-truck-side-view.png', 1, 123, 1, NULL, NULL, NULL, CAST(1.23000 AS Decimal(20, 5)), 1, CAST(N'2019-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2019-10-16T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-04T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'123', N'123', N'123', CAST(123 AS Decimal(4, 0)), N'123', N'123', 1, 1, 123, 123, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'Nhan', N'123', N'123', CAST(123 AS Decimal(4, 0)), N'123', N'123', 1, 1, 123, 123, N'123', 2, N'123', NULL, 1, 123, 1, NULL, NULL, NULL, CAST(1.23000 AS Decimal(20, 5)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'Nhan-test123', N'123', N'123', CAST(123 AS Decimal(4, 0)), N'123', N'123', 1, 1, 123, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'Nhân', N'Hyndai 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Truck] OFF
SET IDENTITY_INSERT [dbo].[TruckType] ON 

INSERT [dbo].[TruckType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'20ft', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'40ft', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Mixed', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TruckType] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [SSN], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy], [SupervisorId]) VALUES (1, N'sys', N'admin', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'123123123', N'123123123', N'Abc', N'Abc', N'09202439', N'02923488', 1, 1, 2, 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [SSN], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy], [SupervisorId]) VALUES (2, N'Quynh', N'Pham', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'999xxxxx', N'12399xxxxx', N'Tinhte', N'Genk', N'123xxx90', N'123xx8xx', 1, 1, 2, 2, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [SSN], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy], [SupervisorId]) VALUES (3, N'Nhan', N'Nguyen', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'098809xx', N'123xxx', N'Quang Ngai', N'Tinhte', N'123xxx90', N'123xx8xx', 1, 1, 2, 2, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserInterface] ON 

INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'TruckPlate', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Truck Plate', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'BrandName', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Brand Name', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Model', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Model', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Year', 10, NULL, N'Number', 1, NULL, NULL, NULL, 2, 1, 0, N'Year', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Color', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Color', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Vin', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Vin', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Id', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Id', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'TruckTypeId', 10, NULL, N'Dropdown', 1, NULL, 18, N'{Name}', 2, 1, NULL, N'Truck Type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'FuelTypeId', 10, NULL, N'Dropdown', 1, NULL, 46, N'{Name}', 2, 1, NULL, N'Fuel Type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'KmPerLit', 10, NULL, N'Number', 1, NULL, NULL, NULL, 2, 1, 0, N'Km/Lit', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'MaxCapacity', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Max Capacity', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'PlateRenewal', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Plate Renewal', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'DepartmentId', 10, NULL, N'Dropdown', 1, NULL, 37, N'{Name}', 2, 1, NULL, N'Department', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'Note', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Note', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'Image', 10, NULL, N'Image', 2, NULL, NULL, NULL, 1, 12, NULL, N'Image', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'InUse', 10, NULL, N'Checkbox', 1, NULL, NULL, NULL, 2, 1, NULL, N'In Use', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'MaxCbm', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Max CBM', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'VendorId', 10, NULL, N'Dropdown', 1, NULL, 21, N'{Name}', 2, 1, NULL, N'Vendor', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'Long', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Long', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'Lat', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'Lat', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'DriverId', 10, NULL, N'Dropdown', 2, N'$filter=Role/RoleName%20eq%20%27Driver%27', 19, N'{FirstName} {LastName}', 2, 1, NULL, N'Driver', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'Price', 10, NULL, N'Number', 3, NULL, NULL, NULL, 2, 1, 2, N'Price', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, N'CurrencyId', 10, NULL, N'Dropdown', 3, NULL, 56, N'{Name}', 2, 1, NULL, N'Currency', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, N'BoughtDate', 10, NULL, N'Datepicker', 3, NULL, NULL, NULL, 2, 1, NULL, N'Bought Date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, N'ActiveDate', 10, NULL, N'Datepicker', 3, NULL, NULL, NULL, 2, 1, NULL, N'Active Date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, N'ExpiredDate', 10, NULL, N'Datepicker', 3, NULL, NULL, NULL, 2, 1, NULL, N'Expired Date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, N'MaintenanceStart', 10, NULL, N'Datepicker', 4, NULL, NULL, NULL, 2, 1, NULL, N'Maintenance Start', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, N'MaintenanceEnd', 10, NULL, N'Datepicker', 4, NULL, NULL, NULL, 2, 1, NULL, N'Maintenance End', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, N'NextMaintenanceDate', 10, NULL, N'Datepicker', 4, NULL, NULL, NULL, 2, 1, NULL, N'NextMaintenance Date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, N'Active', 10, NULL, N'Input', 4, NULL, NULL, NULL, 2, 1, NULL, N'Active', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, N'InsertedDate', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'InsertedDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, N'InsertedBy', 10, NULL, N'Input', 1, NULL, 19, N'{FirstName} {LastName}', 2, 1, NULL, N'InsertedBy', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, N'UpdatedDate', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, N'UpdatedDate', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, N'UpdatedBy', 10, NULL, N'Input', 1, NULL, 19, N'{FirstName} {LastName}', 2, 1, NULL, N'UpdatedBy', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, NULL, 10, NULL, N'Button', 6, NULL, NULL, NULL, 1, 1, NULL, N'Save', 0, N'mif-floppy-disk', N'button info small', NULL, N'Ctrl-s', NULL, N'Save', 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, NULL, 10, NULL, N'Button', 6, NULL, NULL, NULL, 1, 1, NULL, N'Cancel', 0, N'mif-exit', N'button secondary small', NULL, NULL, NULL, N'Dispose', 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, N'Accessory', 10, NULL, N'GridView', 14, N'$filter=Active eq true and TruckId eq ', 1, NULL, 4, 0, NULL, N'Accessory', 0, N'mif-search', N'button info small', N'max-width: 800px;', NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, NULL, 10, NULL, N'Button', 16, NULL, NULL, NULL, 1, 0, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, NULL, 10, NULL, N'Button', 16, NULL, NULL, NULL, 1, 0, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, NULL, 10, NULL, N'Input', 16, NULL, NULL, NULL, 1, 0, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, NULL, 10, NULL, N'Button', 16, NULL, NULL, NULL, 1, 0, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, NULL, 10, NULL, N'Button', 18, NULL, NULL, NULL, 1, 0, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, N'Create', 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, NULL, 10, NULL, N'Button', 18, NULL, NULL, NULL, 1, 0, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, NULL, 10, NULL, N'Input', 18, NULL, NULL, NULL, 1, 0, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, NULL, 10, NULL, N'Button', 18, NULL, NULL, NULL, 1, 0, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, N'TruckGrid', 10, NULL, N'GridView', 19, NULL, 14, NULL, 8, 0, NULL, N'Truck', 0, N'mif-search', N'button info small', N'max-width: 300px; padding: 0;', NULL, NULL, N'{''dblclick'': ''Edit''}', 0, 1, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserInterface] OFF
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Mekoong', 1, N'The main provider', N'12031239', N'1231235', N'ABC', NULL, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Trường Hải', 1, N'Oto lắp ráp', N'123123', N'098098', N'DÈ', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
INSERT [dbo].[VendorType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Truck provider', N'Truck resale', 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[VendorType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Gara', N'Maintenace', 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Workflow] ON 

INSERT [dbo].[Workflow] ([Id], [Name], [Description], [EffectiveDate], [ExpiredDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Frieght work flow', N'N/A', NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Workflow] OFF
ALTER TABLE [dbo].[ComponentGroup] ADD  CONSTRAINT [DF_UIGroup_IsTab]  DEFAULT ((0)) FOR [IsTab]
GO
ALTER TABLE [dbo].[Container] ADD  CONSTRAINT [DF_Container_IsMaintained]  DEFAULT ((0)) FOR [InUse]
GO
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_Allowance]  DEFAULT ((0)) FOR [Allowance]
GO
ALTER TABLE [dbo].[Feature] ADD  CONSTRAINT [DF_Feature_IsMenu]  DEFAULT ((0)) FOR [IsMenu]
GO
ALTER TABLE [dbo].[GridPolicy] ADD  CONSTRAINT [DF_GridPolicy_Frozen]  DEFAULT ((0)) FOR [Frozen]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Weight]  DEFAULT ((0)) FOR [Weight]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Volume]  DEFAULT ((0)) FOR [Volume]
GO
ALTER TABLE [dbo].[Quotation] ADD  CONSTRAINT [DF_Quotation_TotalContainer]  DEFAULT ((0)) FOR [TotalContainer]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessary_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessary_Vendor]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Truck]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_UserInserted]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_UserUpdated]
GO
ALTER TABLE [dbo].[Action]  WITH CHECK ADD  CONSTRAINT [FK_Action_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Action] CHECK CONSTRAINT [FK_Action_UserInserted]
GO
ALTER TABLE [dbo].[Action]  WITH CHECK ADD  CONSTRAINT [FK_Action_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Action] CHECK CONSTRAINT [FK_Action_UserUpdated]
GO
ALTER TABLE [dbo].[ActionPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ActionPolicy_Action] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Action] ([Id])
GO
ALTER TABLE [dbo].[ActionPolicy] CHECK CONSTRAINT [FK_ActionPolicy_Action]
GO
ALTER TABLE [dbo].[ActionPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ActionPolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[ActionPolicy] CHECK CONSTRAINT [FK_ActionPolicy_Policy]
GO
ALTER TABLE [dbo].[ActionPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ActionPolicy_User] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ActionPolicy] CHECK CONSTRAINT [FK_ActionPolicy_User]
GO
ALTER TABLE [dbo].[ActionPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ActionPolicy_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ActionPolicy] CHECK CONSTRAINT [FK_ActionPolicy_UserInserted]
GO
ALTER TABLE [dbo].[CommodityType]  WITH CHECK ADD  CONSTRAINT [FK_CommodityType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[CommodityType] CHECK CONSTRAINT [FK_CommodityType_UserInserted]
GO
ALTER TABLE [dbo].[CommodityType]  WITH CHECK ADD  CONSTRAINT [FK_CommodityType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[CommodityType] CHECK CONSTRAINT [FK_CommodityType_UserUpdated]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_ComponentGroup] FOREIGN KEY([ParentId])
REFERENCES [dbo].[ComponentGroup] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_ComponentGroup]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_Feature]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_FreightState] FOREIGN KEY([StateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_FreightState]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_Policy]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_UserInserted]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_UserUpdated]
GO
ALTER TABLE [dbo].[Container]  WITH CHECK ADD  CONSTRAINT [FK_Container_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Container] CHECK CONSTRAINT [FK_Container_FreightState]
GO
ALTER TABLE [dbo].[Container]  WITH CHECK ADD  CONSTRAINT [FK_Container_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Container] CHECK CONSTRAINT [FK_Container_UserInserted]
GO
ALTER TABLE [dbo].[Container]  WITH CHECK ADD  CONSTRAINT [FK_Container_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Container] CHECK CONSTRAINT [FK_Container_UserUpdated]
GO
ALTER TABLE [dbo].[Container]  WITH CHECK ADD  CONSTRAINT [FK_Container_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Container] CHECK CONSTRAINT [FK_Container_Vendor]
GO
ALTER TABLE [dbo].[ContainerType]  WITH CHECK ADD  CONSTRAINT [FK_ContainerType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerType] CHECK CONSTRAINT [FK_ContainerType_UserInserted]
GO
ALTER TABLE [dbo].[ContainerType]  WITH CHECK ADD  CONSTRAINT [FK_ContainerType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerType] CHECK CONSTRAINT [FK_ContainerType_UserUpdated]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_User]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_UserInserted]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_UserUpdated]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_Container]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_FreightState]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_TerminalFrom] FOREIGN KEY([FromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_TerminalFrom]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_TerminalTo] FOREIGN KEY([ToId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_TerminalTo]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_Truck]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_UserDriver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_UserDriver]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_UserInserted]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_UserUpdated]
GO
ALTER TABLE [dbo].[Currency]  WITH CHECK ADD  CONSTRAINT [FK_Currency_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [FK_Currency_UserInserted]
GO
ALTER TABLE [dbo].[Currency]  WITH CHECK ADD  CONSTRAINT [FK_Currency_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [FK_Currency_UserUpdated]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerGroup] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[CustomerGroup] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerGroup]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Nationality] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationality] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Nationality]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_UserInserted]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_UserUpdated]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Leader] FOREIGN KEY([LeaderId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Leader]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_UserInserted]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_UserUpdated]
GO
ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_UserInserted]
GO
ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_UserUpdated]
GO
ALTER TABLE [dbo].[EntityPolicy]  WITH CHECK ADD  CONSTRAINT [FK_EntityPolicy_Entity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[EntityPolicy] CHECK CONSTRAINT [FK_EntityPolicy_Entity]
GO
ALTER TABLE [dbo].[EntityPolicy]  WITH CHECK ADD  CONSTRAINT [FK_EntityPolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[EntityPolicy] CHECK CONSTRAINT [FK_EntityPolicy_Policy]
GO
ALTER TABLE [dbo].[EntityPolicy]  WITH CHECK ADD  CONSTRAINT [FK_EntityPolicy_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[EntityPolicy] CHECK CONSTRAINT [FK_EntityPolicy_UserInserted]
GO
ALTER TABLE [dbo].[EntityPolicy]  WITH CHECK ADD  CONSTRAINT [FK_EntityPolicy_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[EntityPolicy] CHECK CONSTRAINT [FK_EntityPolicy_UserUpdated]
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_Parent] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [FK_Feature_Parent]
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [FK_Feature_UserInserted]
GO
ALTER TABLE [dbo].[FeaturePolicy]  WITH CHECK ADD  CONSTRAINT [FK_FeaturePolicy_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[FeaturePolicy] CHECK CONSTRAINT [FK_FeaturePolicy_Feature]
GO
ALTER TABLE [dbo].[FeaturePolicy]  WITH CHECK ADD  CONSTRAINT [FK_FeaturePolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[FeaturePolicy] CHECK CONSTRAINT [FK_FeaturePolicy_Policy]
GO
ALTER TABLE [dbo].[FeaturePolicy]  WITH CHECK ADD  CONSTRAINT [FK_FeaturePolicy_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FeaturePolicy] CHECK CONSTRAINT [FK_FeaturePolicy_UserInserted]
GO
ALTER TABLE [dbo].[FeaturePolicy]  WITH CHECK ADD  CONSTRAINT [FK_FeaturePolicy_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FeaturePolicy] CHECK CONSTRAINT [FK_FeaturePolicy_UserUpdated]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_Action] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Action] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_Action]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_Coordination] FOREIGN KEY([CoordinatorId])
REFERENCES [dbo].[Coordination] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_Coordination]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_FreightState]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_UserActor] FOREIGN KEY([ActorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_UserActor]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_UserInserted]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_UserUpdated]
GO
ALTER TABLE [dbo].[FreightProof]  WITH CHECK ADD  CONSTRAINT [FK_FreightProof_FreightHistory] FOREIGN KEY([FreightHistoryId])
REFERENCES [dbo].[FreightHistory] ([Id])
GO
ALTER TABLE [dbo].[FreightProof] CHECK CONSTRAINT [FK_FreightProof_FreightHistory]
GO
ALTER TABLE [dbo].[FreightProof]  WITH CHECK ADD  CONSTRAINT [FK_FreightProof_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightProof] CHECK CONSTRAINT [FK_FreightProof_UserInserted]
GO
ALTER TABLE [dbo].[FreightProof]  WITH CHECK ADD  CONSTRAINT [FK_FreightProof_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightProof] CHECK CONSTRAINT [FK_FreightProof_UserUpdated]
GO
ALTER TABLE [dbo].[FreightState]  WITH CHECK ADD  CONSTRAINT [FK_FreightState_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightState] CHECK CONSTRAINT [FK_FreightState_UserInserted]
GO
ALTER TABLE [dbo].[FreightState]  WITH CHECK ADD  CONSTRAINT [FK_FreightState_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightState] CHECK CONSTRAINT [FK_FreightState_UserUpdated]
GO
ALTER TABLE [dbo].[FreightState]  WITH CHECK ADD  CONSTRAINT [FK_FreightState_Workflow] FOREIGN KEY([WorkflowId])
REFERENCES [dbo].[Workflow] ([Id])
GO
ALTER TABLE [dbo].[FreightState] CHECK CONSTRAINT [FK_FreightState_Workflow]
GO
ALTER TABLE [dbo].[FuelType]  WITH CHECK ADD  CONSTRAINT [FK_FuelType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FuelType] CHECK CONSTRAINT [FK_FuelType_UserInserted]
GO
ALTER TABLE [dbo].[FuelType]  WITH CHECK ADD  CONSTRAINT [FK_FuelType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FuelType] CHECK CONSTRAINT [FK_FuelType_UserUpdated]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_Entity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_Entity]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_Feature]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_FreightState] FOREIGN KEY([StateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_FreightState]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_Policy]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_RefEntity] FOREIGN KEY([ReferenceId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_RefEntity]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_UserInserted]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_UserUpdated]
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD  CONSTRAINT [FK_GroupMember_GroupRole_GroupRoleId] FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRole] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_GroupRole_GroupRoleId]
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD  CONSTRAINT [FK_GroupMember_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_Role_RoleId]
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD  CONSTRAINT [FK_GroupMember_User_InsertedBy] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_User_InsertedBy]
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD  CONSTRAINT [FK_GroupMember_User_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_User_UpdatedBy]
GO
ALTER TABLE [dbo].[GroupRole]  WITH CHECK ADD  CONSTRAINT [FK_GroupRole_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GroupRole] CHECK CONSTRAINT [FK_GroupRole_UserInserted]
GO
ALTER TABLE [dbo].[GroupRole]  WITH CHECK ADD  CONSTRAINT [FK_GroupRole_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GroupRole] CHECK CONSTRAINT [FK_GroupRole_UserUpdated]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_Currency] FOREIGN KEY([CurencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_Currency]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_Entity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_Entity]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_Objective] FOREIGN KEY([ObjectiveId])
REFERENCES [dbo].[Objective] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_Objective]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_OperationType] FOREIGN KEY([OperationTypeId])
REFERENCES [dbo].[OperationType] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_OperationType]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_UserApprover] FOREIGN KEY([ApproverId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_UserApprover]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_UserInserted]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_UserUpdated]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Accessory] FOREIGN KEY([AccessaryId])
REFERENCES [dbo].[Accessory] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Accessory]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Assignee] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Assignee]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Container]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_GroupRole] FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRole] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_GroupRole]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Role]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_TicketState] FOREIGN KEY([Id])
REFERENCES [dbo].[TicketState] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_TicketState]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Truck]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_UserInserted]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_UserUpdated]
GO
ALTER TABLE [dbo].[Nationality]  WITH CHECK ADD  CONSTRAINT [FK_Nationality_UserInserted] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Nationality] CHECK CONSTRAINT [FK_Nationality_UserInserted]
GO
ALTER TABLE [dbo].[Nationality]  WITH CHECK ADD  CONSTRAINT [FK_Nationality_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Nationality] CHECK CONSTRAINT [FK_Nationality_UserUpdated]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TerminalFrom] FOREIGN KEY([FromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TerminalFrom]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TerminalTo] FOREIGN KEY([Id])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TerminalTo]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserInserted]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserUpdated]
GO
ALTER TABLE [dbo].[OrderComposition]  WITH CHECK ADD  CONSTRAINT [FK_OrderComposition_Coordination] FOREIGN KEY([CoordinationId])
REFERENCES [dbo].[Coordination] ([Id])
GO
ALTER TABLE [dbo].[OrderComposition] CHECK CONSTRAINT [FK_OrderComposition_Coordination]
GO
ALTER TABLE [dbo].[OrderComposition]  WITH CHECK ADD  CONSTRAINT [FK_OrderComposition_OrderDetail] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetail] ([Id])
GO
ALTER TABLE [dbo].[OrderComposition] CHECK CONSTRAINT [FK_OrderComposition_OrderDetail]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_CommodityType] FOREIGN KEY([CommodityTypeId])
REFERENCES [dbo].[CommodityType] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_CommodityType]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Quotation] FOREIGN KEY([QuotationId])
REFERENCES [dbo].[Quotation] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Quotation]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Timebox] FOREIGN KEY([TimeboxId])
REFERENCES [dbo].[Timebox] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Timebox]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_UserInserted]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_UserUpdated]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Vendor]
GO
ALTER TABLE [dbo].[PaymentPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalConfig_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PaymentPolicy] CHECK CONSTRAINT [FK_ApprovalConfig_UserInserted]
GO
ALTER TABLE [dbo].[PaymentPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalConfig_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PaymentPolicy] CHECK CONSTRAINT [FK_ApprovalConfig_UserUpdated]
GO
ALTER TABLE [dbo].[PaymentPolicy]  WITH CHECK ADD  CONSTRAINT [FK_PaymentPolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[PaymentPolicy] CHECK CONSTRAINT [FK_PaymentPolicy_Policy]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_CommodityType] FOREIGN KEY([CommodityTypeId])
REFERENCES [dbo].[CommodityType] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_CommodityType]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_ContainerType] FOREIGN KEY([ContainerTypeId])
REFERENCES [dbo].[ContainerType] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_ContainerType]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Customer]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_CustomerGroup] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[CustomerGroup] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_CustomerGroup]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_TerminalFrom] FOREIGN KEY([FromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_TerminalFrom]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_TerminalTo] FOREIGN KEY([ToId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_TerminalTo]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Timebox] FOREIGN KEY([TimeboxId])
REFERENCES [dbo].[Timebox] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Timebox]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_UserInserted]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_UserUpdated]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Vendor]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_VolumeRange] FOREIGN KEY([VolumeRangeId])
REFERENCES [dbo].[VolumeRange] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_VolumeRange]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_WeightRange] FOREIGN KEY([WeightRangeId])
REFERENCES [dbo].[WeightRange] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_WeightRange]
GO
ALTER TABLE [dbo].[StatePolicy]  WITH CHECK ADD  CONSTRAINT [FK_StatePolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[StatePolicy] CHECK CONSTRAINT [FK_StatePolicy_Policy]
GO
ALTER TABLE [dbo].[StatePolicy]  WITH CHECK ADD  CONSTRAINT [FK_StatePolicy_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[StatePolicy] CHECK CONSTRAINT [FK_StatePolicy_State]
GO
ALTER TABLE [dbo].[StatePolicy]  WITH CHECK ADD  CONSTRAINT [FK_StatePolicy_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StatePolicy] CHECK CONSTRAINT [FK_StatePolicy_UserInserted]
GO
ALTER TABLE [dbo].[StatePolicy]  WITH CHECK ADD  CONSTRAINT [FK_StatePolicy_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StatePolicy] CHECK CONSTRAINT [FK_StatePolicy_UserUpdated]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_OrderDetail] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetail] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_OrderDetail]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_UserInserted]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_UserUpdated] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_UserUpdated]
GO
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_Nationality] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationality] ([Id])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_Nationality]
GO
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_UserInserted] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_UserInserted]
GO
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_UserUpdated]
GO
ALTER TABLE [dbo].[TicketState]  WITH CHECK ADD  CONSTRAINT [FK_TicketState_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TicketState] CHECK CONSTRAINT [FK_TicketState_UserInserted]
GO
ALTER TABLE [dbo].[TicketState]  WITH CHECK ADD  CONSTRAINT [FK_TicketState_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TicketState] CHECK CONSTRAINT [FK_TicketState_UserUpdated]
GO
ALTER TABLE [dbo].[Timebox]  WITH CHECK ADD  CONSTRAINT [FK_Timebox_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Timebox] CHECK CONSTRAINT [FK_Timebox_UserInserted]
GO
ALTER TABLE [dbo].[Timebox]  WITH CHECK ADD  CONSTRAINT [FK_Timebox_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Timebox] CHECK CONSTRAINT [FK_Timebox_UserUpdated]
GO
ALTER TABLE [dbo].[Transition]  WITH CHECK ADD  CONSTRAINT [FK_Transition_FreightStateCurrent] FOREIGN KEY([CurrentStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Transition] CHECK CONSTRAINT [FK_Transition_FreightStateCurrent]
GO
ALTER TABLE [dbo].[Transition]  WITH CHECK ADD  CONSTRAINT [FK_Transition_FreightStateNext] FOREIGN KEY([NextStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Transition] CHECK CONSTRAINT [FK_Transition_FreightStateNext]
GO
ALTER TABLE [dbo].[Transition]  WITH CHECK ADD  CONSTRAINT [FK_Transition_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Transition] CHECK CONSTRAINT [FK_Transition_UserInserted]
GO
ALTER TABLE [dbo].[Transition]  WITH CHECK ADD  CONSTRAINT [FK_Transition_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Transition] CHECK CONSTRAINT [FK_Transition_UserUpdated]
GO
ALTER TABLE [dbo].[Transition]  WITH CHECK ADD  CONSTRAINT [FK_Transition_Workflow] FOREIGN KEY([WorkflowId])
REFERENCES [dbo].[Workflow] ([Id])
GO
ALTER TABLE [dbo].[Transition] CHECK CONSTRAINT [FK_Transition_Workflow]
GO
ALTER TABLE [dbo].[TransitionAction]  WITH CHECK ADD  CONSTRAINT [FK_TransitionAction_Action] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Action] ([Id])
GO
ALTER TABLE [dbo].[TransitionAction] CHECK CONSTRAINT [FK_TransitionAction_Action]
GO
ALTER TABLE [dbo].[TransitionAction]  WITH CHECK ADD  CONSTRAINT [FK_TransitionAction_Transition] FOREIGN KEY([TransitionId])
REFERENCES [dbo].[Transition] ([Id])
GO
ALTER TABLE [dbo].[TransitionAction] CHECK CONSTRAINT [FK_TransitionAction_Transition]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_Currency]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_FuelType] FOREIGN KEY([FuelTypeId])
REFERENCES [dbo].[FuelType] ([Id])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_FuelType]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_TruckType] FOREIGN KEY([TruckTypeId])
REFERENCES [dbo].[TruckType] ([Id])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_TruckType]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_Currency]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_MaintenanceTicket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[MaintenanceTicket] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_MaintenanceTicket]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_Truck]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_TruckMaintenance] FOREIGN KEY([Id])
REFERENCES [dbo].[TruckMaintenance] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_TruckMaintenance]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_UserAccountable] FOREIGN KEY([AccountableUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_UserAccountable]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_UserInserted]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_UserUpdated]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_Vendor]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_Accessory] FOREIGN KEY([AccessaryId])
REFERENCES [dbo].[Accessory] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_Accessory]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_Maintenance] FOREIGN KEY([MaintenanceId])
REFERENCES [dbo].[TruckMaintenance] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_Maintenance]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_UserInserted]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_UserUpdated]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_Accessory] FOREIGN KEY([AccessoryId])
REFERENCES [dbo].[Accessory] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_Accessory]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_Truck]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_UserInserted]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_UserUpdated]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitorConfig_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitorConfig_Policy]
GO
ALTER TABLE [dbo].[TruckType]  WITH CHECK ADD  CONSTRAINT [FK_TruckType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckType] CHECK CONSTRAINT [FK_TruckType_UserInserted]
GO
ALTER TABLE [dbo].[TruckType]  WITH CHECK ADD  CONSTRAINT [FK_TruckType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckType] CHECK CONSTRAINT [FK_TruckType_UserUpdated]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Contract]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Nationality] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationality] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Nationality]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User_SupervisorId] FOREIGN KEY([SupervisorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User_SupervisorId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserInserted]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserUpdated]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_ComponentGroup] FOREIGN KEY([ComponentGroupId])
REFERENCES [dbo].[ComponentGroup] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_ComponentGroup]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_Entity] FOREIGN KEY([ReferenceId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_Entity]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_FreightState] FOREIGN KEY([StateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_FreightState]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_Policy]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_UserInserted]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_UserUpdated]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_VendorType] FOREIGN KEY([VendorTypeId])
REFERENCES [dbo].[VendorType] ([Id])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_VendorType]
GO
ALTER TABLE [dbo].[VendorType]  WITH CHECK ADD  CONSTRAINT [FK_VendorType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[VendorType] CHECK CONSTRAINT [FK_VendorType_UserInserted]
GO
ALTER TABLE [dbo].[VendorType]  WITH CHECK ADD  CONSTRAINT [FK_VendorType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[VendorType] CHECK CONSTRAINT [FK_VendorType_UserUpdated]
GO
ALTER TABLE [dbo].[VolumeRange]  WITH CHECK ADD  CONSTRAINT [FK_VolumeRange_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[VolumeRange] CHECK CONSTRAINT [FK_VolumeRange_UserInserted]
GO
ALTER TABLE [dbo].[VolumeRange]  WITH CHECK ADD  CONSTRAINT [FK_VolumeRange_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[VolumeRange] CHECK CONSTRAINT [FK_VolumeRange_UserUpdated]
GO
ALTER TABLE [dbo].[WeightRange]  WITH CHECK ADD  CONSTRAINT [FK_WeightRange_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[WeightRange] CHECK CONSTRAINT [FK_WeightRange_UserInserted]
GO
ALTER TABLE [dbo].[WeightRange]  WITH CHECK ADD  CONSTRAINT [FK_WeightRange_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[WeightRange] CHECK CONSTRAINT [FK_WeightRange_UserUpdated]
GO
ALTER TABLE [dbo].[Workflow]  WITH CHECK ADD  CONSTRAINT [FK_Workflow_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Workflow] CHECK CONSTRAINT [FK_Workflow_UserInserted]
GO
ALTER TABLE [dbo].[Workflow]  WITH CHECK ADD  CONSTRAINT [FK_Workflow_UserUpdated] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Workflow] CHECK CONSTRAINT [FK_Workflow_UserUpdated]
GO
ALTER DATABASE [TMS] SET  READ_WRITE 
GO
