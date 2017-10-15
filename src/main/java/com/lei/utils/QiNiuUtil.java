package com.lei.utils;    

import com.qiniu.util.Auth;
import java.io.IOException;
import java.io.InputStream;
import com.qiniu.common.QiniuException;    
import com.qiniu.http.Response;  
import com.qiniu.storage.Configuration;  
import com.qiniu.storage.UploadManager;    
/**
 * 七牛云文件上传工具类
 * Author: pibigstar
 * Created on: 2017年10月15日 下午8:23:19
 */
public class QiNiuUtil {    

	public static boolean upload(InputStream file,String savePath) throws IOException{    
		try {
			String ACCESS_KEY = ResourceUtil.getConfigByName("qiniu.ak");    
			String SECRET_KEY = ResourceUtil.getConfigByName("qiniu.sk");    
			//要上传的空间名--    
			String bucketname = ResourceUtil.getConfigByName("qiniu.bucketname");    
			//密钥配置    
			Auth auth = Auth.create(ACCESS_KEY,SECRET_KEY);    
			//创建上传对象    
			UploadManager uploadManager =new UploadManager(new Configuration());   
			Response res = uploadManager.put(file, savePath, auth.uploadToken(bucketname),null,null);
			//打印返回的信息    
			System.out.println(res.bodyString());  
			if (res.statusCode==200) {
				return true;
			}
		} catch (QiniuException e) {    
			Response r = e.response;    
			System.out.println(r.toString());    
			return false;  
		}
		return false;           
	}
}    