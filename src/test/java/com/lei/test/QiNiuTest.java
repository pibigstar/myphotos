package com.lei.test;

import com.qiniu.util.Auth;    
import java.io.IOException;
import java.util.UUID;

import com.qiniu.common.QiniuException;    
import com.qiniu.http.Response;  
import com.qiniu.storage.Configuration;  
import com.qiniu.storage.UploadManager;    

public class QiNiuTest {

	/**基本配置-从七牛管理后台拿到*/    
	//设置好账号的ACCESS_KEY和SECRET_KEY    
	String ACCESS_KEY = "gjV0W-M61rMJUlgQ89DVdryi6MAC0eaJYWgwWk-z";    
	String SECRET_KEY = "8gfZRmg3JS7foYLF0C8A029BfsN6HDGNPzX50g_I";    
	//要上传的空间名--    
	String bucketname = "myproject";    



	/**指定保存到七牛的文件名--同名上传会报错  {"error":"file exists"}*/    
	/** {"hash":"FrQF5eX_kNsNKwgGNeJ4TbBA0Xzr","key":"aa1.jpg"} 正常返回 key为七牛空间地址 http:/xxxx.com/aa1.jpg */    
	//上传文件的路径    
	String FilePath ="D:\\2.jpg";    
	//上传到七牛后保存的文件名    访问为：http://oswj11a86.bkt.clouddn.com/daimo6.png  
	String key = "images/"+UUID.randomUUID().toString()+".jpg";      

	//密钥配置    
	Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);    
	//创建上传对象    
	UploadManager uploadManager =new UploadManager(new Configuration());   


	//简单上传，使用默认策略，只需要设置上传的空间名就可以了    
	public String getUpToken(){    
		return auth.uploadToken(bucketname);    
	}    

	public void upload() throws IOException{    
		try {    
			//调用put方法上传    

			Response res = uploadManager.put(FilePath, key, getUpToken());    
			//打印返回的信息    
			System.out.println(res.bodyString());    
			System.out.println(res.statusCode);//200为上传成功  
		} catch (QiniuException e) {    
			Response r = e.response;    
			// 请求失败时打印的异常的信息    
			System.out.println(r.toString());    
			try {    
				//响应的文本信息    
				System.out.println(r.bodyString());    
			} catch (QiniuException e1) {    
				//ignore    
			}    
		}           
	}    

	public static void main(String args[]) throws IOException{      
		new QiNiuTest().upload();    
	}    
}
