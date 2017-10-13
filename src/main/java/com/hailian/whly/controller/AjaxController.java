package com.hailian.whly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hailian.whly.service.WhlyAccountService;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

/**
 * 
 * @className AjaxController.java
 * @time   2017年9月29日 下午5:16:29
 * @author zuoqb
 * @todo   TODO
 */
@Controller
@RequestMapping("${whlyPath}/ajax")
public class AjaxController extends BaseController {
	@Autowired
	private WhlyAccountService service;
	@Autowired
	private SystemService systemService;

    /**
     * 获取列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/getAccountList")
    public String getAccountList(HttpServletRequest request, HttpServletResponse response){
        try {
        	List<Menu> sourcelist = systemService.findAllFrontMenu();
            return resultSuccessData(response,"查询数据成功", sourcelist);
        } catch (Exception e) {
            return resultErrorData(response,"查询数据异常", null);
        }
    }

}
