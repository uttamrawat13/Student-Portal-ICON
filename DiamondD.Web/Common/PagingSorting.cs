using System;
using System.Collections.Generic;
using System.Linq;

namespace DiamondD.Web.Common
{
    public static class PagingSorting<T> 
    {
        public static IList<T> getPagedRecords(IList<T> data, int pageIndex, int pageRecords)
        {
            return data.Skip(pageIndex * pageRecords).Take(pageRecords).ToList();
        }

        public static IList<T> getSortedList(IList<T> unSortedList, string sortBy, string sortOrder)
        {

            if (sortOrder == "Asc")
            {
                return unSortedList.OrderBy(r => r.GetType().GetProperty(sortBy).GetValue(r,null)).ToList();
            }
            else
            {
                return unSortedList.OrderByDescending(r => r.GetType().GetProperty(sortBy).GetValue(r, null)).ToList();
            }
                
        }

    }
}
