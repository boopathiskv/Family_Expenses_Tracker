using BO;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL
{
    public class UserDetails_BAL
    {
        public bool Register_Function(UserDetails Uds)
        {
            UserDetails_DAL dAL = new UserDetails_DAL();
            return dAL.Register_Function(Uds);
        }

        public bool User_Login(UserDetails Uds)
        {
            UserDetails_DAL dAL = new UserDetails_DAL();
            return dAL.User_Login(Uds);
        }

    }
}
