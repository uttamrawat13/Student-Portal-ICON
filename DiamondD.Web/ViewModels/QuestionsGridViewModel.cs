using Lib.Web.Mvc.JQuery.JqGrid;
using Lib.Web.Mvc.JQuery.JqGrid.Constants;
using Lib.Web.Mvc.JQuery.JqGrid.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DiamondD.Web.ViewModels
{
    public class QuestionsGridViewModel
    {   
        [HiddenInput(DisplayValue = false)]
        public int QuestionId { get; set; }
        [JqGridColumnLayout(Alignment = JqGridAlignments.Center, Width = 415)]
        [JqGridColumnEditable(true,EditType=JqGridColumnEditTypes.TextArea)]
        public string Quetion { get; set; }
        
        [JqGridColumnLayout(Alignment = JqGridAlignments.Center, Width = 75)]
        [JqGridColumnEditable(true, EditType = JqGridColumnEditTypes.JQueryUISpinner,Min=1)]
        public int Order { get; set; }
        [JqGridColumnLayout(Alignment = JqGridAlignments.Center, Width = 75)]
        [JqGridColumnEditable(true, EditType = JqGridColumnEditTypes.CheckBox)]
        [JqGridColumnFormatter("$.BooleanFormater")]
        public bool Numeric { get; set; }
        [JqGridColumnLayout(Alignment = JqGridAlignments.Center, Width = 75)]
        [JqGridColumnEditable(true, EditType = JqGridColumnEditTypes.CheckBox)]
        [JqGridColumnFormatter("$.BooleanFormater")]
        public bool Active { get; set; }
        //public string actions { get; set; }
    }
}