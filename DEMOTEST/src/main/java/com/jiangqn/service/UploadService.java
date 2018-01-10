package com.jiangqn.service;

import com.jiangqn.service.impl.UploadServiceImpl;

import java.io.File;

public interface UploadService {
    UploadServiceImpl ReadExcelUtils(String filepath);
}
