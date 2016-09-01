using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
//using Json.Net;

namespace DiamondD.Web.Common
{
    public class JsonModelBinder: IModelBinder
        {
            private readonly static JavaScriptSerializer _serializer = new JavaScriptSerializer();

            public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
            {
                var stringified = controllerContext.HttpContext.Request[bindingContext.ModelName];

                if (string.IsNullOrEmpty(stringified))
                    return null;

                return _serializer.Deserialize(stringified, bindingContext.ModelType);
            }
        }

    public class FromJsonAttribute : CustomModelBinderAttribute
    {
        public override IModelBinder GetBinder()
        {
            return new JsonModelBinder();
        }
    }


    //public class JsonFilter : ActionFilterAttribute
    //{
    //    public string Param { get; set; }
    //    public Type JsonDataType { get; set; }
    //    public override void OnActionExecuting(ActionExecutingContext filterContext)
    //    {
    //        if (filterContext.HttpContext.Request.ContentType.Contains("application/json"))
    //        {
    //            string inputContent;
    //            using (var sr = new StreamReader(filterContext.HttpContext.Request.InputStream))
    //            {
    //                inputContent = sr.ReadToEnd();
    //            }
    //            var result = JsonConvert.DeserializeObject(inputContent, JsonDataType);
    //            filterContext.ActionParameters[Param] = result;
    //        }
    //    }
    //}

}