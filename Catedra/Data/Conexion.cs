namespace Catedra.Data
{
    public class Conexion
    {
        // Cadena de conexión que mandaremos a llamar dentro de las clases
        private string StringSQL = string.Empty;

        public Conexion()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            StringSQL = builder.GetSection("ConnectionStrings:StringSQL").Value;
        }

        public string getConnectSQL()
        {
            return StringSQL;
        }
    }
}
