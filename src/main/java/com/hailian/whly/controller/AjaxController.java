package com.hailian.whly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hailian.utils.PageBean;
import com.hailian.whly.entity.WhlyAccount;
import com.hailian.whly.service.WhlyAccountService;
import com.thinkgem.jeesite.common.web.BaseController;

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


    /**
     * 获取列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/getAccountList")
    public String getAccountList(Integer currentpage,HttpServletRequest request, HttpServletResponse response){
        try {
            if(currentpage == null){
                currentpage = 1;
            }
            List<WhlyAccount> list=service.findList(null);
          //  long count = service.getCounts(new HashMap<String, Object>());
            long count = 101l;
            PageBean bean = new PageBean();
            bean.setPageSize(10);
            bean.setCurrentPage(currentpage);
            bean.setList(list);
            bean.setTotalPage((int)Math.ceil((double) count/10));
            bean.setTotal(count);
            return resultSuccessData(response,"查询行业数据成功", bean);
        } catch (Exception e) {
            return resultErrorData(response,"查询数据异常", null);
        }
    }

}
