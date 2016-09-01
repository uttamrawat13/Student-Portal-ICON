using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiamondD.Services.Common;

namespace DiamondD.Web.Common
{
    public enum ResponseType
    {
        Error = 1,
        Success
    }

    public class ResponseMessage
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string Footer { get; set; }
        public ResponseType Type { get; set; }
    }
}