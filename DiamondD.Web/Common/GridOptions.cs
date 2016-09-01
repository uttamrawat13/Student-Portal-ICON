using System;
using System.Collections.Generic;
using System.Linq;
using Lib.Web.Mvc.JQuery.JqGrid;

namespace DiamondD.Web.Common
{
    public static class GridOptions
    {
        public const JqGridDataTypes DataType = JqGridDataTypes.Json;
        public const JqGridMethodTypes MethodType = JqGridMethodTypes.Post;
        public const bool IsPaging = true;
        public const int PageSize=20;
        public const bool ViewRecords = true;
    }
}
