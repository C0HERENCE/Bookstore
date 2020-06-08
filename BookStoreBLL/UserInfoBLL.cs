﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BookStoreMisc;
using BookStoreDAL;

namespace BookStoreBLL
{
    public class UserInfoBLL
    {
        public static bool Login(string name, string pwd, bool isAdmin)
        {
            pwd = MD5Encrypt.GetMD5(pwd);
            int ans = 0;
            if (isAdmin)
                ans = UserInfoDAL.SelectUserRole1(name, pwd);
            else
                ans = UserInfoDAL.SelectUserRole0(name, pwd);

            if (ans == 0)
                return false;
            else
                return true;
        }

        public static string GetUserCountByNameAndPwd(string name, string pwd, bool isAdmin)
        {
            pwd = MD5Encrypt.GetMD5(pwd);
            string msg = "";
            if (isAdmin)
            {
                if (UserInfoDAL.SelectUserRole1(name, pwd) == 1)
                {
                    msg = "登录成功";
                }
            }
            else
            {
                if (UserInfoDAL.SelectUserRole1(name, pwd) == 1)
                {
                    msg = "登录成功";
                }
            }


            if (UserInfoDAL.SelectUserEnabled(name) == 0)
            {
                msg = "你已被封禁";
            }
            return msg;
        }
        public static int GetUserCountByName(string name)
        {
            return UserInfoDAL.SelectUserCountByName(name);
        }
        public static int GetUserCountByMail(string mail)
        {
            return UserInfoDAL.SelectUserCountByMail(mail);
        }

        public static string AddUser(UserInfoModel user)
        {
            string msg = "注册失败";
            if (GetUserCountByName(user.username) > 0)
            {
                msg = "用户名已存在";
            }
            if (GetUserCountByName(user.mail) > 0)
            {
                msg = "该邮箱已被注册";
            }
            if (UserInfoDAL.InsertUser(user) > 0)
            {
                msg = "注册成功";
            }
            return msg;
        }
    }
}