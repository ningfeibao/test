package com.hand.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hand.dao.EmployeeDao;
import com.hand.pojo.Employee;
import com.hand.service.EmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
	@Resource
	private EmployeeDao employeeDao;
	
	/**
	 * ��ѯԱ���б�
	 * @param pageNum
	 * @return
	 */
	public List<Employee> getAllEmps() {
		return employeeDao.selectEmps();
	}

	/**
	 * ���Ա��
	 * @param pageNum
	 * @return
	 */
	public void addEmployee(Employee employee) {
		employeeDao.insert(employee);
	}

	/**
	 * ����id��ѯԱ��
	 * @param id
	 * @return
	 */
	public Employee getEmployee(Integer id) {
		return employeeDao.selectByPrimaryKey(id);
	}

	/**
	 * ����id�޸�Ա��
	 * @param id
	 * @return
	 */
	public void updateEmployee(Employee employee) {
		employeeDao.updateById(employee);
	}

	/**
	 * ����id�޸�Ա��
	 * @param id
	 * @return
	 */
	public void deleteEmployee(Integer id) {
		employeeDao.deleteByPrimaryKey(id);
	}

	@Override
	public void deleteBatch(List<Integer> delIds) {
		for (int id : delIds) {
			employeeDao.deleteByPrimaryKey(id);
		}
	}

	@Override
	public List<Employee> searchEmps(String name) {
		return employeeDao.selectByName(name);
	}
}
