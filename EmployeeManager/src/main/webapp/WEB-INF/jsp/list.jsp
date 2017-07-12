<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<script type="text/javascript" src="${PATH}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${PATH}/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${PATH}/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<!-- 员工修改Modal -->
	<div class="modal fade" id="updateEmpsModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empUpdateName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-4">
								<input type="text" name="empName" class="form-control"
									id="empUpdateName" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="empUpdateGender" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="empGender" value="M" checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="empGender" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="empUpdateAge" class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-4">
								<input type="text" name="empAge" class="form-control"
									id="empUpdateAge" placeholder="age">
							</div>
						</div>
						<div class="form-group">
							<label for="empUpdateAddress" class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input type="text" name="empAddress" class="form-control"
									id="empUpdateAddress" placeholder="address">
							</div>
						</div>
						<div class="form-group">
							<label for="empUpdateComments" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-10">
								<input type="text" name="comments" class="form-control"
									id="empUpdateComments" placeholder="comments">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="empUpdate">更新</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 员工添加Modal -->
	<div class="modal fade" id="addEmpsModal" tabindex="-1" role="dialog"
		aria-labelledby="addEmpsModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addEmpsModalLabel">添加员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="emp_name" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-4">
								<input type="text" name="empName" class="form-control"
									id="emp_name" placeholder="empName">
							</div>
						</div>
						<div class="form-group">
							<label for="emp_gender" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="empGender" id="gender1" value="M" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="empGender" id="gender2" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="emp_age" class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-4">
								<input type="text" name="empAge" class="form-control"
									id="emp_age" placeholder="empAge">
							</div>
						</div>
						<div class="form-group">
							<label for="emp_address" class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input type="text" name="empAddress" class="form-control"
									id="user_address" placeholder="empAddress">
							</div>
						</div>
						<div class="form-group">
							<label for="comments" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-10">
								<input type="text" name="comments" class="form-control"
									id="comments" placeholder="comments">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="userSave">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 表格 -->
	<div class="container">
		<div class="row">
				<h1>员工列表</h1>
			<div class="col-md-2 col-md-offset-10" style="margin-bottom: 10px;">
				<button class="btn btn-primary" id="addEmpsBtn">&nbsp;新增</button>
				<button class="btn btn-danger" id="delEmpsBtn">&nbsp;删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table style="text-align: center;"
					class="table table-hover table-bordered" id="empsTable">
					<thead>
						<tr>
							<th style="text-align: center;"><input type="checkbox"
								id="checkAllEmps"></th>
							<th style="text-align: center;">编号</th>
							<th style="text-align: center;">姓名</th>
							<th style="text-align: center;">性别</th>
							<th style="text-align: center;">年龄</th>
							<th style="text-align: center;">地址</th>
							<th style="text-align: center;">备注</th>
							<th style="text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6" id="pageInfoArea"></div>
			<div class="col-md-6" id="pageNavArea"></div>
		</div>
	</div>
	
	<script type="text/javascript">
		var totalRecord, currentPage, editId;
		//初始显示首页
		$(function() {
			toPage(1);
		});
		//页面跳转
		function toPage(pageNum) {
			$.ajax({
				url : "${PATH}/emps",
				data : "pageNum=" + pageNum,
				type : "POST",
				success : function(result) {
					buildEmpsTable(result);
					buildPageInfo(result);
					buildPageNavigation(result);
				}
			});
		}
		//构建数据展示table
		function buildEmpsTable(result) {
			$("#empsTable tbody").empty();
			var emps = result.extend.pageInfo.list;
			$
					.each(
							emps,
							function(index, item) {
								var checkBoxTd = $("<td><input type='checkbox' class='checkItem'/></td>");
								var empIdTd = $("<td></td>").append(item.empId);
								var empNameTd = $("<td></td>").addClass(
										"col-md-2").append(item.empName);
								var empGenderTd = $("<td></td>").addClass(
										"col-md-1").append(
										item.empGender == 'M' ? "男" : "女");
								var empAgeTd = $("<td></td>").addClass(
										"col-md-1").append(item.empAge);
								var empAddressTd = $("<td></td>").addClass(
										"col-md-3").append(item.empAddress);
								var commentsTd = $("<td></td>").addClass(
										"col-md-2").append(item.comments);
								var editBtn = $("<button></button>").addClass(
										"btn btn-primary btn-sm editBtn")
										.append("<span></span>").addClass(
												"glyphicon glyphicon-pencil")
										.append("编辑");
								editBtn.attr("editId", item.empId);
								var delBtn = $("<button></button>").addClass(
										"btn btn-danger btn-sm delBtn").append(
										"<span></span>").addClass(
										"glyphicon glyphicon-trash").append(
										"删除");
								delBtn.attr("delId", item.empId);
								var btnTd = $("<td></td>").addClass("col-md-2")
										.append(editBtn).append("&nbsp;")
										.append(delBtn);
								$("<tr></tr>").append(checkBoxTd).append(
										empIdTd).append(empNameTd).append(
										empGenderTd).append(empAgeTd).append(
										empAddressTd).append(commentsTd)
										.append(btnTd).appendTo(
												"#empsTable tbody");
							})
		}
		//构建页码展示
		function buildPageInfo(result) {
			$("#pageInfoArea").empty();
			$("#pageInfoArea").append(
					"当前第[" + result.extend.pageInfo.pageNum + "]页，总共["
							+ result.extend.pageInfo.pages + "]页，总共["
							+ result.extend.pageInfo.total + "]条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//构建分页展示
		function buildPageNavigation(result) {
			$("#pageNavArea").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页")
							.attr("href", "javascript:void(0)"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;").attr("href",
							"javascript:void(0)"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function() {
					toPage(1);
				});
				prePageLi.click(function() {
					toPage(result.extend.pageInfo.pageNum - 1);
				});
			}
			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;").attr("href",
							"javascript:void(0)"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页")
							.attr("href", "javascript:void(0)"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					toPage(result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					toPage(result.extend.pageInfo.pages);
				});
			}
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append(
						$("<a></a>").attr("href", "javascript:void(0)").append(
								item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					toPage(item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页 的提示
			ul.append(nextPageLi).append(lastPageLi);
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#pageNavArea");
		}
		//打开员工新增模态框
		$("#addEmpsBtn").click(function() {
			$("#addEmpsModal").modal({
				backdrop : "static"
			});
		});
		//发起ajax请求，添加员工
		$("#userSave").click(function() {
			if (!validateEmpName()) {
				return false;
			}
			$.ajax({
				url : "${PATH}/add",
				data : $("#addEmpsModal form").serialize(),
				type : "POST",
				success : function(result) {
					$("#addEmpsModal").modal('hide');
					toPage(Math.floor(totalRecord / 5) + 1);
				}
			});
		});
		//姓名非空校验
		function validateEmpName() {
			var empName = $("#emp_name").val();
			if (empName == "" || empName == null) {
				return false;
			}
			return true;
		}

		//编辑员工信息，发起请求回显信息
		$(document).on(
				"click",
				".editBtn",
				function() {
					$("#updateEmpsModal").modal({
						backdrop : "static"
					});
					editId = $(this).attr("editId");
					$.ajax({
						url : "${PATH}/emp/" + editId,
						type : "POST",
						success : function(result) {
							var empData = result.extend.emp;
							$("#empUpdateName").val(empData.empName);
							$("#updateEmpsModal input[name=empGender]").val(
									[ empData.empGender ]);
							$("#empUpdateAge").val(empData.empAge);
							$("#empUpdateAddress").val(empData.empAddress);
							$("#empUpdateComments").val(empData.comments);

						}
					});

				});

		//发起请求保存修改
		$("#empUpdate").click(function() {
			$.ajax({
				url : "${PATH}/edit/" + editId,
				type : "POST",
				data : $("#updateEmpsModal form").serialize(),
				success : function(result) {
					$("#updateEmpsModal").modal("hide");
					toPage(currentPage);
				}
			});
		});

		//发起请求删除单个员工
		$(document).on("click", ".delBtn", function() {
			if (confirm("是否确认删除？")) {
				$.ajax({
					url : "${PATH}/delete/" + $(this).attr("delId"),
					type : "POST",
					success : function(result) {
						toPage(currentPage);
					}
				});
			}
		});

		//checkBox全选
		$("#checkAllEmps").click(function() {
			//attr获取checked是undefined;
			//我们这些dom原生的属性；attr获取自定义属性的值；
			//prop修改和读取dom原生属性的值
			$(".checkItem").prop("checked", $(this).prop("checked"));
		});

		$(document)
				.on(
						"click",
						".checkItem",
						function() {
							//判断当前选择中的元素是否5个
							var flag = $(".checkItem:checked").length == $(".checkItem").length;
							$("#checkAllEmps").prop("checked", flag);
						});

		//点击全部删除，就批量删除
		$("#delEmpsBtn").click(
				function() {
					var delIdStr = "";
					$.each($(".checkItem:checked"), function() {
						//组装员工id字符串
						delIdStr += $(this).parents("tr").find("td:eq(1)")
								.text()
								+ "-";
					});
					//去除删除的id多余的-
					delIdStr = delIdStr.substring(0, delIdStr.length - 1);
					if (confirm("是否确认删除？")) {
						//发送ajax请求删除
						$.ajax({
							url : "${PATH}/delAll/" + delIdStr,
							type : "POST",
							success : function(result) {
								$("#checkAllEmps").prop("checked", false)
								toPage(currentPage);
							}
						});
					}
				});
	</script>
</body>
</html>