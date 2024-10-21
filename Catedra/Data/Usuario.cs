using Catedra.Models;
using System.Data.SqlClient;
using System.Data;

namespace Catedra.Data
{
    public class Usuario
    {
        public List<UsuariosModelo> LogIn(string username, string password)
        {
            var ObjList = new List<UsuariosModelo>();

            // Create an object to access the connection
            var cn = new Conexion();

            using (var connect = new SqlConnection(cn.getConnectSQL()))
            {
                // Open the connection
                connect.Open();

                // Call the stored procedure 'LogInUser'
                SqlCommand getUser = new SqlCommand("LogInUser", connect);
                getUser.CommandType = CommandType.StoredProcedure;

                // Use the correct parameter names as expected by the stored procedure
                getUser.Parameters.AddWithValue("@Usuario", username); // Changed from @username to @Usuario
                getUser.Parameters.AddWithValue("@Password_Usuario", password);   // Changed from @password to @Clave

                // Execute the stored procedure and read the data
                using (var rd = getUser.ExecuteReader())
                {
                    if (rd.HasRows)
                    {
                        while (rd.Read())
                        {
                            ObjList.Add(new UsuariosModelo()
                            {
                                Id = Convert.ToInt32(rd["ID"]),  // Adjust based on your DB structure
                                User = rd["Usuario"].ToString(), // Replace with your actual field names
                            });
                        }
                    }
                    else
                    {
                        // Handle invalid login (no rows returned)
                        throw new Exception("Invalid username or password.");
                    }
                }
            }

            return ObjList;
        }



        public List<UsuariosModelo> Shown()
        {
            var ObjList = new List<UsuariosModelo>();

            // Creamos un objeto para poder acceder a la conexión
            var cn = new Conexion();

            using (var connect = new SqlConnection(cn.getConnectSQL()))
            {
                // Abrir la conexión
                connect.Open();

                SqlCommand getProduct = new SqlCommand("GetAllUsers", connect);
                getProduct.CommandType = CommandType.StoredProcedure;

                // Leer los datos por medio de un while
                using (var rd = getProduct.ExecuteReader())
                {
                    while (rd.Read())
                    {
                        ObjList.Add(new UsuariosModelo()
                        {
                            // Se pasa el nombre de los campos del procedimiento
                            Id = Convert.ToInt32(rd["ID"]),
                            UserName = rd["Nombre"].ToString(),
                            UserLastName = rd["Apellido"].ToString(),
                            UserEmail = rd["Email"].ToString(),
                            UserPhone = rd["Telefono"].ToString(),
                            User = rd["Usuario"].ToString(),                            
                        });
                    }
                }
            }
            return ObjList;
        }


        // Stored procedure for save users
        public bool SaveData(UsuariosModelo PrdReq)
        {
            bool response = false;
            try
            {
                var cn = new Conexion();
                using (var connect = new SqlConnection(cn.getConnectSQL()))
                {
                    connect.Open();

                    // Defino que tipo de comando le tiro al server, (Stored Procedure)
                    SqlCommand InsertData = new SqlCommand("sp_CreateUsuario", connect);

                    // Mandamos los datos como parámetros a la base (Se puede aumentar la seguridad pero no lo veo necesario)
                    InsertData.Parameters.AddWithValue("@Nombre_Usuario", PrdReq.UserName);
                    InsertData.Parameters.AddWithValue("@Apellido_Usuario", PrdReq.UserLastName);
                    InsertData.Parameters.AddWithValue("@Correo_Usuario", PrdReq.UserEmail);
                    InsertData.Parameters.AddWithValue("@Telefono_Usuario", PrdReq.UserPhone);
                    InsertData.Parameters.AddWithValue("@Usuario", PrdReq.User);
                    InsertData.Parameters.AddWithValue("@Password_Usuario", PrdReq.UserPWD);
                    
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





        public bool DeleteData(UsuariosModelo DelData)
        {
            bool response;
            try
            {
                var cn = new Conexion();

                using (var connect = new SqlConnection(cn.getConnectSQL()))
                {
                    connect.Open();

                    SqlCommand DeleteData = new SqlCommand("sp_DeleteUsuario", connect);
                    // Solo neceito 1 dato (el ID) porque el procedimiento hace lo demás
                    DeleteData.Parameters.AddWithValue("@ID_Usuario", DelData.Id);
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
    }
}
