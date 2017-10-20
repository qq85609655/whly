package com.hailian.whly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;

/**
 * 
 * @className TaskManageController.java
 * @time   2017年10月19日 下午6:16:28
 * @author zuoqb
 * @todo   业务管理
 */
@Controller
@RequestMapping("${whlyPath}/taskmange")
public class TaskManageController extends BaseController {
	/**
	 * 
	 * @time   2017年10月1日 下午8:43:04
	 * @author zuoqb
	 * @todo   数据审核列表
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping({"/examine/list"})
	public String examineList(){
		return whlyPage+"/taskmange/examineList";
	}
	/**
	 * 
	 * @time   2017年10月19日 下午6:27:11
	 * @author zuoqb
	 * @todo   企业上报
	 */
	@RequestMapping({"/company/report"})
	public String report(){
		return whlyPage+"/taskmange/report";
	}
	/**
	 * 
	 * @time   2017年10月19日 下午6:32:22
	 * @author zuoqb
	 * @todo   审核
	 * @param  @return
	 * @return_type   String
	 */
	@RequestMapping({"/examine/form"})
	public String examineForm(){
		return whlyPage+"/taskmange/examineForm";
	}
}
