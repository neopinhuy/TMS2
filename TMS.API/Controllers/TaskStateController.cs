using Nest;
using TMS.API.Models;
using TaskState = TMS.API.Models.TaskState;

namespace TMS.API.Controllers
{
    public class TaskStateController : GenericController<TaskState>
    {
        public TaskStateController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
