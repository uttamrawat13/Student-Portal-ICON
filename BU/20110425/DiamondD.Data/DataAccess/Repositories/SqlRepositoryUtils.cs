using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DiamondD.Data.DataAccess.Repositories.Base;
using DiamondD.Data.Properties;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration.ContainerModel;

namespace DiamondD.Data.DataAccess.Repositories
{
    /// <summary>
    /// Singleton class, provides utility methods for database operations.
    /// </summary>
    public static class SqlRepositoryUtils
    {
        private const string ConnectionStringId = "DD_StudentPortal_ConnectionString";

        public static Database CreateDatabase()
        {

            return EnterpriseLibraryContainer.Current.GetInstance<Database>(ConnectionStringId);
        }

        public static Database CreateDatabase(this IBaseRepository repository)
        {
            return CreateDatabase();
        }

        public static IDataReader ExecuteReader(this IBaseRepository repository, CommandType commandType,  string query)
        {
            var database = CreateDatabase(repository);            
            return database.ExecuteReader(commandType, query);
        }

        public static int ExecuteNonQuery(this IBaseRepository repository, CommandType commandType, string query)
        {
            var database = CreateDatabase(repository);
            return database.ExecuteNonQuery(commandType, query);
        }

        public static object ExecuteScalar(this IBaseRepository repository, CommandType commandType, string query)
        {
            var database = CreateDatabase(repository);
            return database.ExecuteScalar(commandType, query);            
        }

        public static DataSet ExecuteDataSet(this IBaseRepository repository, CommandType commandType, string query)
        {           
            var database = CreateDatabase(repository);
            return database.ExecuteDataSet(commandType, query);            
        }
    }
}
