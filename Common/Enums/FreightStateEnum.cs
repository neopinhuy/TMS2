namespace Common.Enums
{
    public enum FreightStateEnum
    {
        Moving = 1,
        Idle = 2,
        InOrder = 3,
        InCoordination = 4,
        ReadyToTransit = 5,
        InTransit = 6,
        Delivered = 7
    }

    public enum TaskStateEnum
    {
        Unread = 1,
        Read = 2,
        Processing = 3,
        Done = 4
    }
}
