// SOME CODE MISSING DUE TO PROPRIETARY NATURE
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;


namespace Sabio.Services.EmergencyContacts
{
    public class EmergencyContactService : IEmergencyContactService
    {
        private IDataProvider _dataProvider = null;

        public EmergencyContactService(IDataProvider dataProvider)
        {
            _dataProvider = dataProvider;
        }

        public int Add(EmergencyContactAddRequest model, int userId)
        {
            int id = 0;
            string procName = "[dbo].[EmergencyContacts_Insert]";

            _dataProvider.ExecuteNonQuery(procName, inputParamMapper: delegate (SqlParameterCollection col)
            {
                AddCommonParams(model, col);
                col.AddWithValue("@userId", userId);
                
                SqlParameter idOut = new SqlParameter("@Id", SqlDbType.Int, 0);
                idOut.Direction = ParameterDirection.Output;
                col.Add(idOut);

            }, returnParameters: delegate (SqlParameterCollection returnCollection)
            {
                object oId = returnCollection["@Id"].Value;
                int.TryParse(oId.ToString(), out id);
            });

            return id;
        }

        public void Update(EmergencyContactUpdateRequest model, int userId)
        {
            string procName = "[dbo].[EmergencyContacts_Update]";

            _dataProvider.ExecuteNonQuery(procName, inputParamMapper: delegate (SqlParameterCollection col)
            {
                AddCommonParams(model, col);
                col.AddWithValue("@Id", model.Id);
                col.AddWithValue("@UserId", userId);

            }, returnParameters: null);
        }

        public void Delete(int id)
        {
            string procName = "[dbo].[EmergencyContacts_Delete_ById]";

            _dataProvider.ExecuteNonQuery(procName, inputParamMapper: delegate (SqlParameterCollection col)
            {
                col.AddWithValue("@Id", id);

            }, returnParameters: null);
        }

        public List<EmergencyContact> GetByUserId(int userId)
        {
            string procName = "[dbo].[EmergencyContacts_Select_ByUserId]";

            List<EmergencyContact> list = null;
            EmergencyContact contactService = null;

            _dataProvider.ExecuteCmd(procName, delegate (SqlParameterCollection col)
            {
                col.AddWithValue("@UserId", userId);
            }, delegate (IDataReader reader, short set)
            {
                int startingIndex = 0;
                contactService = MapSingleEmergContact(reader, ref startingIndex);

                if (list == null)
                {
                    list = new List<EmergencyContact>();
                }
                list.Add(contactService);
            });

            return list;
        }

        private static EmergencyContact MapSingleEmergContact(IDataReader reader, ref int startingIndex)
        {
            EmergencyContact aContact = new EmergencyContact();

            aContact.Id = reader.GetSafeInt32(startingIndex++);
            aContact.UserId = reader.GetSafeInt32(startingIndex++);
            aContact.Name = reader.GetSafeString(startingIndex++);
            aContact.PhoneNumber = reader.GetSafeString(startingIndex++);

            return aContact;

        }

        private static void AddCommonParams(EmergencyContactAddRequest model, SqlParameterCollection col)
        {
            
            col.AddWithValue("@Name", model.Name);
            col.AddWithValue("@PhoneNumber", model.PhoneNumber);

        }
    }


}
