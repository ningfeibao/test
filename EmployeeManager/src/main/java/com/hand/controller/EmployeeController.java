package com.hand.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hand.pojo.Employee;
import com.hand.pojo.User;
import com.hand.service.EmployeeService;
import com.hand.utils.Message;

/**
 * 员工CRUD类
 * 
 * @author 宁飞豹
 *
 */
@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	/**
	 * 主页访问跳转 
	 * @return
	 */
	@RequestMapping("/show")
	public String toList() {
		return "list";
	}

	/**
	 * 显示员工列表
	 * 
	 * @param pageNum
	 * @return
	 */
	@RequestMapping(value = "/emps", method = RequestMethod.POST)
	@ResponseBody
	public Message getEmployees(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
		PageHelper.startPage(pageNum, 5);
		List<Employee> empList = employeeService.getAllEmps();
		PageInfo pageInfo = new PageInfo(empList, 5);
		return Message.success().add("pageInfo", pageInfo);
	}

	/**
	 * 添加员工
	 * 
	 * @param pageNum
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Message addEmployee(Employee employee) {
		employeeService.addEmployee(employee);
		return Message.success();
	}

	/**
	 * 查询单个员工
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Message getEmp(@PathVariable("id") Integer id) {

		Employee employee = employeeService.getEmployee(id);
		return Message.success().add("emp", employee);
	}
	

	/**
	 * 修改员工
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Message editEmployee(@PathVariable("id") Integer id, Employee employee) {
		employee.setEmpId(id);
		employeeService.updateEmployee(employee);
		return Message.success();
	}

	/**
	 * 根据员工id删除
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Message delEmployee(@PathVariable("id") Integer id) {
		employeeService.deleteEmployee(id);
		return Message.success();
	}

	/**
	 * 批量删除员工
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delAll/{ids}", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteEmps(@PathVariable("ids") String ids) {
		if (ids.contains("-")) {
			List<Integer> delIds = new ArrayList<>();
			String[] strIds = ids.split("-");
			for (String string : strIds) {
				delIds.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(delIds);
		} else {
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmployee(id);
		}
		return Message.success();
	}
}
