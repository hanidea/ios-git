//: Playground - noun: a place where people can play

import Cocoa

let registrationResult = (isRegisterSuccess:true,nickname:"test男神",gender:"女")
let connectionResult = (404,"Not Found")

let(isRegisterSuccess, nickname, gender)=registrationResult
isRegisterSuccess
nickname
gender

registrationResult.0
registrationResult.1
registrationResult.2

registrationResult.isRegisterSuccess
registrationResult.nickname
registrationResult.gender

let loginResult:(Bool,String) = (true,"test2男神")
let (isLoginSuccess,_)=loginResult
if isLoginSuccess{
    print("登录成功")
}
