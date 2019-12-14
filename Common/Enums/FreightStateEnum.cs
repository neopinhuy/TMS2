namespace Common.Enums
{
    public enum FreightStateEnum
    {
        InOrder = 1,
        InCoordination = 2,
        ReadyToTransit = 3,
        InTransit = 4,
        Delivered = 5,
    }

    public enum TaskStateEnum
    {
        Unread = 1,
        Read = 2,
        Processing = 3,
        Done = 4
    }
}
