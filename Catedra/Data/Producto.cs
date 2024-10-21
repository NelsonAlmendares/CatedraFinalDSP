using Catedra.Models;    
using System.Data.SqlClient;
using System.Data;

namespace Catedra.Data
{
    public class Producto
    {
        // Metodo para mostrar los datos de la tabla por medio de un procedimiento almacenado
        public List<ProductModelo> Shown() { 
            var ObjList = new List<ProductModelo>();

            // Creamos un objeto para poder acceder a la conexión
            var cn = new Conexion();

            using (var connect = new SqlConnection(cn.getConnectSQL())) { 
                // Abrir la conexión
                connect.Open();

                SqlCommand getProduct = new SqlCommand("GetRecursos", connect);
                getProduct.CommandType = CommandType.StoredProcedure;

                // Leer los datos por medio de un while
                using (var rd = getProduct.ExecuteReader()) {
                    while (rd.Read()) {
                        ObjList.Add(new ProductModelo() {
                            // Se pasa el nombre de los campos del procedimiento
                            IdRecurso = Convert.ToInt32(rd["Recurso"]),
                            Title = rd["Titulo"].ToString(),
                            AnnioProduction = rd["Publicación"].ToString(),
                            IdEditorial = rd["Editorial"].ToString(),
                            Edition = rd["Edicion"].ToString(),
                            IdCountry = rd["País"].ToString(),
                            Cantidad = Convert.ToInt32(rd["Unidades"].ToString()),
                            Precio = rd["Precio"].ToString()
                        });
                    }
                }
            }
            return ObjList;
        }

        public ProductModelo GetDataByID(int IdProducto) {
            // Objeto para acceder a la clase de datos
            var ObjList = new ProductModelo();

            var cn = new Conexion();
            using (var connect = new SqlConnection(cn.getConnectSQL())) {
                connect.Open();

                SqlCommand GetProductByID = new SqlCommand("GetRecursosByID", connect);
                GetProductByID.Parameters.AddWithValue("@Id", IdProducto);
                GetProductByID.CommandType = CommandType.StoredProcedure;

                using (var rd = GetProductByID.ExecuteReader()) 
                {
                    while (rd.Read()) 
                    {
                        ObjList.IdRecurso = Convert.ToInt32(rd["Recurso"]);
                        ObjList.Title = rd["Titulo"].ToString();
                        ObjList.AnnioProduction = rd["Publicación"].ToString();
                        ObjList.IdEditorial = rd["Editorial"].ToString();
                        ObjList.Edition = rd["Edicion"].ToString();
                        ObjList.IdCountry = rd["País"].ToString();
                        ObjList.Cantidad = Convert.ToInt32(rd["Unidades"].ToString());
                        ObjList.Precio = rd["Precio"].ToString();
                        ObjList.Busqueda = rd["Busqueda"].ToString();
                    }
                }
            }
            return ObjList;
        }
        

        public List<PaisModelo> GetData()
        {
            var ObjList = new List<PaisModelo>();
           
            var cn = new Conexion();
            using (var connect = new SqlConnection(cn.getConnectSQL())) { 
                connect.Open();
                SqlCommand getProduct = new SqlCommand("GetPais", connect);
                using (var rd = getProduct.ExecuteReader()) { 
                    while (rd.Read()) {
                        ObjList.Add(new PaisModelo() { 
                            Id = Convert.ToInt32(rd["IdPais"]),
                            Pais = rd["nombrez"].ToString()

                        });
                    }
                }
            }
            return ObjList;
        }

        public bool SaveData(ProductModelo PrdReq) {
            bool response = false;
            try
            {
                var cn = new Conexion();
                using (var connect = new SqlConnection(cn.getConnectSQL())) {
                    connect.Open();

                    // Defino que tipo de comando le tiro al server, (Stored Procedure)
                    SqlCommand InsertData = new SqlCommand("InsertRecurso", connect);
                    
                    // Mandamos los datos como parámetros a la base (Se puede aumentar la seguridad pero no lo veo necesario)
                    InsertData.Parameters.AddWithValue("@titulo", PrdReq.Title);
                    InsertData.Parameters.AddWithValue("@annopulibc", PrdReq.AnnioProduction);
                    InsertData.Parameters.AddWithValue("@IdEdit", PrdReq.IdEditorial);
                    InsertData.Parameters.AddWithValue("@edicion", PrdReq.Edition);
                    InsertData.Parameters.AddWithValue("@IdPais", PrdReq.IdCountry);
                    InsertData.Parameters.AddWithValue("@unidades", PrdReq.Cantidad);
                    InsertData.Parameters.AddWithValue("@precio", PrdReq.Price);
                    InsertData.Parameters.AddWithValue("@palabra", PrdReq.Busqueda);
                    InsertData.CommandType = CommandType.StoredProcedure;
                    InsertData.ExecuteNonQuery();
                    //@annopulibc
                }
                response = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at: " + ex);
                response = false;
            }
            return response;
        }

        // Metodo para poder actualizar los datos de la base todos parametrizados
        public bool UpdateData(ProductModelo PrdReq) {
            bool response;

            try
            {
                var cn = new Conexion();

                using (var connect = new SqlConnection(cn.getConnectSQL())) { 
                    connect.Open();

                    SqlCommand UpdateData = new SqlCommand("UpdateRecurso", connect);
                    UpdateData.Parameters.AddWithValue("@titulo", PrdReq.Title);
                    UpdateData.Parameters.AddWithValue("@annopulibc", PrdReq.AnnioProduction);
                    UpdateData.Parameters.AddWithValue("@IdEdit", PrdReq.IdEditorial);
                    UpdateData.Parameters.AddWithValue("@edicion", PrdReq.Edition);
                    UpdateData.Parameters.AddWithValue("@IdPais", PrdReq.IdCountry);
                    UpdateData.Parameters.AddWithValue("@IdRec", PrdReq.IdRecurso);
                    // Defino el tipo de comando que le tiro al server
                    UpdateData.CommandType = CommandType.StoredProcedure;
                    // Ejecutamos las consultas
                    UpdateData.ExecuteNonQuery();
                }
                response = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at:" + ex);
                response = false;
            }
            return response;
        }

        public bool DeleteData(ProductModelo DelData) {
            bool response;
            try
            {
                var cn = new Conexion();

                using (var connect = new SqlConnection(cn.getConnectSQL())) {
                    connect.Open();

                    SqlCommand DeleteData = new SqlCommand("DeleteRecurso", connect);
                    // Solo neceito 1 dato (el ID) porque el procedimiento hace lo demás
                    DeleteData.Parameters.AddWithValue("@IdRec", DelData.IdRecurso);
                    // Defino el tipo de comando que tiro al sever
                    DeleteData.CommandType = CommandType.StoredProcedure;
                    DeleteData.ExecuteNonQuery();
                }

                response = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at:" + ex);
                return false;
            }
            return response;
        }

        public List<ProductModelo> ChartData1() {
            var productList = new List<ProductModelo>();

            // Creamos un objeto para la conexión
            var cn = new Conexion();

            using (var connect = new SqlConnection(cn.getConnectSQL()))
            {
                connect.Open();

                SqlCommand cmd = new SqlCommand("GetUnitsByDate", connect);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        productList.Add(new ProductModelo()
                        {
                            DateAdded = reader["Fecha de Ingreso"].ToString(),
                            Cantidad = Convert.ToInt32(reader["Unidades"])
                        });
                    }
                }
            }
            return productList;
        }
    }
}
