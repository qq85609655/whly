package com.hailian.whly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hailian.whly.service.WhlyAccountService;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;

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
	private CategoryService categoryService;

    /**
     * 获取列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/getAccountList")
    public String getAccountList(HttpServletRequest request, HttpServletResponse response){
        try {
        	List<Category> list= categoryService.findByUserWhly(true, null,response);
            return resultSuccessData(response,"查询行业数据成功", list);
        } catch (Exception e) {
            return resultErrorData(response,"查询数据异常", null);
        }
    }

}
