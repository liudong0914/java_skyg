package com.chen.action.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.chen.action.BaseAction;
import com.chen.bean.PageTime;
import com.chen.bean.Pager;
import com.chen.entity.Files;
import com.chen.entity.Filetype;
import com.chen.entity.Memu;
import com.chen.entity.Operatelog;
import com.chen.entity.Users;
import com.chen.service.file.FileService;
import com.chen.service.file.FileTypeService;
import com.chen.service.sys.LeftMemuService;
import com.chen.service.sys.OperatelogService;
import com.chen.util.SystemUtil;
import com.opensymphony.xwork2.ActionContext;

@Results( { @Result(name = "toList", type = "redirect", location = "file_info!list.action") })
public class FileInfoAction extends BaseAction {
	// Service
	private FileService fileService;
	private FileTypeService fileTypeService;
	private OperatelogService operatelogService;
	private LeftMemuService leftMemuService;
	// 保存相对应的数据
	private PageTime pageTime;
	private List<Files> file;
	private List<Files> subFile;
	private List<Files> subFile2;
	private List<Files> subFile3;
	private List<Files> deleteFile;
	private List<Filetype> fileTypeList;
	private List<Files> fmseachList;
	private Map<Files, List<Files>> mapFiles;
	private File header;
	private String headerFileName;
	private String headerFileTypeName;
	// 保存文件路径
	private String filePath;
	// 保存文件类型id
	private Integer filetypeId;
	// 保存下载文件名
	private String fileName;
	// 保存菜单Id
	private Integer memuId;
	// 保存文件名
	private String name;
	// 保存备注名
	private String remark;
	// 保存filesId
	private Integer fileId;
	// 保存一个Files
	private Files files;
	private static final long serialVersionUID = 4739077580076951075L;

	public String list() {
		// ServletActionContext.getRequest().setAttribute("documentService",
		// fileService);
		// 父文件跟子文件
		file = fileService.getFile();
		subFile = fileService.getFiles();
		subFile2 = fileService.getSubFiles();
		subFile3 = fileService.getSubFiles2();
		mapFiles = fileService.getFiless();
		if (pager == null)
			pager = new Pager();
		position();
		return LIST;
	}

	public String mapFile() {
		mapFiles = fileService.getFiless();
		JsonConfig jsonConfig = new JsonConfig();
		// 排除属性
		String[] excludes = new String[] { "accessoryfiles", "filetype" };
		jsonConfig.setExcludes(excludes);
		JSONObject mapfileJson = JSONObject.fromObject(mapFiles, jsonConfig);
		// 得到response
		HttpServletResponse response = ServletActionContext.getResponse();
		String mapfileStr = mapfileJson.toString();
		System.out.println(mapfileStr);
		try {
			response.getWriter().print(mapfileStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String fileInfo() {
		// 根据路径得到一个实体
		files = fileService.get("filePath", files.getFilePath());
		// 得到父文件夹的子文件
		pager = fileService.findBySubFile(pager, files);
		return list();
	}

	// 删除到回收站，改变ifDelete列的值
	public String del() {
		Files files = fileService.get(fileId);
		files.setIfDelete(1);
		fileService.update(files);
		Users user = (Users) getSession("loginUser");
		Operatelog log = new Operatelog();
		log.setUsers(user);// 操作人
		log.setOperateName("删除");
		// 操作备注
		log.setOperateDesc("放入回收站");
		Memu submemu = leftMemuService.get("memuId", memuId);
		log.setMemu(submemu);
		// 删除时间
		log.setOperateTime(SystemUtil.getTimestamp(new Date()));
		operatelogService.save(log);
		return list();
	}

	// 回收站
	public String recyle() {
		if (pager == null)
			pager = new Pager();
		DetachedCriteria dc = DetachedCriteria.forClass(Files.class);
		dc.add(Restrictions.eq("ifDelete", 1));
		if (pageTime != null) {
			dc.add(Restrictions.between("createDate", SystemUtil
					.getTimesByStr(pageTime.getBeginTime()), SystemUtil
					.getTimesByStr(pageTime.getEndTime())));
		}
		pager = fileService.findByPager(pager, dc);
		position();
		// ServletActionContext.getRequest().setAttribute("deleteFile",
		// deleteFile);
		return "recyle";
	}

	// 永久删除-同时删除数据库数据
	public String ifDel() {
		fileService.delete(fileId);
		Users user = (Users) getSession("loginUser");
		Operatelog log = new Operatelog();
		log.setUsers(user);// 操作人
		log.setOperateName("删除");
		// 操作备注
		log.setOperateDesc("永久删除");
		Memu submemu = leftMemuService.get("memuId", memuId);
		log.setMemu(submemu);
		// 删除时间
		log.setOperateTime(SystemUtil.getTimestamp(new Date()));
		operatelogService.save(log);
		return recyle();
	}

	// 前往添加页面
	public String toAddFile() {
		fileTypeList = fileTypeService.getFileTypeAll();
		Memu submemu = leftMemuService.get("memuId", memuId);
		Memu memu = leftMemuService.get("memuId", submemu.getParentNodeId());
		ServletActionContext.getRequest().setAttribute("memu",
				memu.getDisplayName());
		submemu.setDisplayName("添加文件");
		ServletActionContext.getRequest().setAttribute("submemu", submemu);
		file = fileService.getFile();
		return "addFile";
	}

	public String doAddFile() {
		String path = ServletActionContext.getServletContext().getRealPath("/")
				+ "files\\" + headerFileName;
		System.out.println("path:" + path);
		System.out.println("headerFileName" + headerFileName);
		if (header != null) {
			File newFile = new File(new File(path), headerFileName);
			if (!newFile.getParentFile().exists()) {
				newFile.getParentFile().mkdirs();
			}
			try {
				FileUtils.copyFile(header, newFile);
				ActionContext.getContext().put("success", "上传成功！");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 得到登陆用户
		Users user = (Users) getSession("loginUser");

		// 设置文件所属用户
		files.setFileOwner(user.getUserId());
		// 是否删除
		files.setIfDelete(0);
		files.setFilePath(headerFileName);
		Timestamp time = new Timestamp(new Date().getTime());
		files.setCreateDate(time);
		// 文件类型
		Filetype filetype = fileTypeService.get(filetypeId);
		files.setFiletype(filetype);
		// 添加文件
		fileService.addFile(files);
		// 添加操作日志
		Operatelog log = new Operatelog();
		log.setUsers(user);// 操作人
		log.setOperateName("添加");
		Memu submemu = leftMemuService.get("memuId", memuId);
		log.setMemu(submemu);
		// 操作备注
		log.setOperateDesc("添加文件");
		// 删除时间
		log.setOperateTime(SystemUtil.getTimestamp(new Date()));
		operatelogService.save(log);
		return list();
	}

	// 到达文件搜索
	public String fmseach() {
		if (pager == null)
			pager = new Pager();
		position();
		return "fmseach";
	}

	// 文件搜索
	public String doFmseach() {
		if (pager == null)
			pager = new Pager();
		pager = fileService.findByFile(pager, name, remark);
		return fmseach();
	}

	// 当前位置
	public void position() {
		Memu submemu = leftMemuService.get("memuId", memuId);
		Memu memu = leftMemuService.get("memuId", submemu.getParentNodeId());
		ServletActionContext.getRequest().setAttribute("memu",
				memu.getDisplayName());
		ServletActionContext.getRequest().setAttribute("submemu", submemu);
	}

	@Override
	public String execute() throws Exception {
		return "ok";
	}

	// 实际下载方法：方法名是对result参数中的inputName的属性值的get封装
	public InputStream getDownloadFile() throws Exception {
		// 1、得到要下载的文件的完整路径
		String path = ServletActionContext.getServletContext().getRealPath("/")
				+ "files\\" + fileName;
		System.out.println("download:"+path);
		// 2、必须得到HttpServletReponse对象
		HttpServletResponse response = ServletActionContext.getResponse();
		// 3、设置响应的内容类型
		response.setContentType("application/x-msdownload"); // 指定响应动作是下载
		// 4、将要下载的文件转换成流
		FileInputStream stream = new FileInputStream(new File(path));
		// 5、弹出下载框时，显示什么
		// response.setHeader(" -Disposition",
		// "attachment;filename="+name);
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String(fileName.getBytes("gbk"), "iso-8859-1"));
		return stream;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	// spring注入属性
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}

	public List<Files> getFile() {
		return file;
	}

	public void setFile(List<Files> file) {
		this.file = file;
	}

	public List<Files> getSubFile() {
		return subFile;
	}

	public void setSubFile(List<Files> subFile) {
		this.subFile = subFile;
	}

	public List<Files> getSubFile2() {
		return subFile2;
	}

	public void setSubFile2(List<Files> subFile2) {
		this.subFile2 = subFile2;
	}

	public List<Files> getSubFile3() {
		return subFile3;
	}

	public void setSubFile3(List<Files> subFile3) {
		this.subFile3 = subFile3;
	}

	public Integer getFileId() {
		return fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	public List<Files> getDeleteFile() {
		return deleteFile;
	}

	public void setDeleteFile(List<Files> deleteFile) {
		this.deleteFile = deleteFile;
	}

	public Files getFiles() {
		return files;
	}

	public void setFiles(Files files) {
		this.files = files;
	}

	public void setFileTypeService(FileTypeService fileTypeService) {
		this.fileTypeService = fileTypeService;
	}

	public void setFileTypeList(List<Filetype> fileTypeList) {
		this.fileTypeList = fileTypeList;
	}

	public List<Filetype> getFileTypeList() {
		return fileTypeList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setFmseachList(List<Files> fmseachList) {
		this.fmseachList = fmseachList;
	}

	public List<Files> getFmseachList() {
		return fmseachList;
	}

	public void setOperatelogService(OperatelogService operatelogService) {
		this.operatelogService = operatelogService;
	}

	public void setMemuId(Integer memuId) {
		this.memuId = memuId;
	}

	public void setLeftMemuService(LeftMemuService leftMemuService) {
		this.leftMemuService = leftMemuService;
	}

	public PageTime getPageTime() {
		return pageTime;
	}

	public void setPageTime(PageTime pageTime) {
		this.pageTime = pageTime;
	}

	public Map<Files, List<Files>> getMapFiles() {
		return mapFiles;
	}

	public void setMapFiles(Map<Files, List<Files>> mapFiles) {
		this.mapFiles = mapFiles;
	}

	public File getHeader() {
		return header;
	}

	public void setHeader(File header) {
		this.header = header;
	}

	public String getHeaderFileName() {
		return headerFileName;
	}

	public void setHeaderFileName(String headerFileName) {
		this.headerFileName = headerFileName;
	}

	public String getHeaderFileTypeName() {
		return headerFileTypeName;
	}

	public void setHeaderFileTypeName(String headerFileTypeName) {
		this.headerFileTypeName = headerFileTypeName;
	}

	public Integer getFiletypeId() {
		return filetypeId;
	}

	public void setFiletypeId(Integer filetypeId) {
		this.filetypeId = filetypeId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
