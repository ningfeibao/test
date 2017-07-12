package com.hand.service;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hand.pojo.Employee;
import com.hand.utils.Message;
/**
 * Ա��service
 * @author ���ɱ�
 * @since 2017/7/6
 */
public interface EmployeeService {
	
	/**
	 * ��ѯ����Ա��
	 * @return
	 */
	public List<Employee> getAllEmps();

	/**
	 * ���Ա��
	 * @return
	 */
	public void addEmployee(Employee employee);

	/**
	 * ����id��ѯԱ��
	 * @param id
	 * @return
	 */
	public Employee getEmployee(Integer id);
	
	/**
	 * ����id�޸�Ա��
	 * @param id
	 * @return
	 */
	public void updateEmployee(Employee employee);
	
	/**
	 * ����id�޸�Ա��
	 * @param id
	 * @return
	 */
	public void deleteEmployee(Integer id);

	public void deleteBatch(List<Integer> delIds);

	public List<Employee> searchEmps(String name);
}
