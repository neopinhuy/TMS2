using System.Collections.Generic;

namespace Common.ViewModels
{
    public class EmailVM
    {
        public List<string> ToAddresses { get; set; }
        public List<string> CC { get; set; }
        public List<string> BCC { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
    }
}
