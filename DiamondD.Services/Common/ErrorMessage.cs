using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace DiamondD.Services.Common
{
    public enum ErrorMessage : int
    {
        [StringValue("Some error occured on server side. Please try later.")]
        UserDefinedMessage = 1,
    }
    public class StringValueAttribute : Attribute
    {
        public string StringValue;

        public StringValueAttribute(string value)
        {
            this.StringValue = value;
        }
    }
    public static class EnumUtils
    {
        public static string GetStringValue(Enum value)
        {
            // Get the type
            Type type = value.GetType();

            // Get fieldinfo for this type
            FieldInfo fieldInfo = type.GetField(value.ToString());
            // Get the stringvalue attributes
            StringValueAttribute[] attribs = fieldInfo.GetCustomAttributes(
                typeof(StringValueAttribute), false) as StringValueAttribute[];
            // Return the first if there was a match.
            return attribs.Length > 0 ? attribs[0].StringValue : null;
        }

    }
}
