package com.neusoft.service.impl;


import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import com.neusoft.base.dao.BaseDao;
import com.neusoft.service.BaseService;
import com.neusoft.utils.Pager;


public class  BaseServiceImpl<T> implements BaseService<T>{
	/** 
     * 注入BaseDao 
     */  
	@Autowired
    private BaseDao<T> dao;  

	public BaseDao<T> getDao() {
		return dao;
	}

	public void setDao(BaseDao<T> dao) {
		this.dao = dao;
	}

	public void save(T entity) {
		dao.add(entity);
	}

	public void update(T entity) {
		dao.update(entity);
	}

	public void delete(int id) {
		dao.delete(id);
	}

	public T getById(int id) {
		return dao.load(id);
	}

	public List<T> getByHQL(String hql, Map<String, Object> alias) {
		return  dao.listByAlias(hql, alias);
	}

	@Override
	public T getOneByHql(String hql, Map<String, Object> alias) {
		return dao.getByParams(hql,alias);
	}

	public  boolean isEmpty(final String str) {
		return (null == str) || (str.trim().length() <= 0);
	}

	
	public  boolean isEmpty(final Character cha) {
		return ( null==cha) || cha.equals(' ');
	}

	
	public  boolean isEmpty(final Object obj) {
		return (null==obj);
	}


	public  boolean isEmpty(final Object[] objs) {
		return (null==objs) || (objs.length <= 0);
	}

	
	public  boolean isEmpty(final Collection<?> obj) {
		return (null==obj) || obj.isEmpty();
	}


	
	public  boolean isEmpty(final Set<?> set) {
		return (null==set) || set.isEmpty();
	}

	
	public  boolean isEmpty(final Serializable obj) {
		return null==obj;
	}

	
	public  boolean isEmpty(final Map<?, ?> map) {
		return (null==map) || map.isEmpty();
	}

	@Override
	public List<T> listByKeyUserHql(String column, String model, String columnValue, String condition) {
		// TODO Auto-generated method stub
		return dao.listByKeyUserHql(column,model,columnValue,condition);
	}

	@Override
	public List<T> listByKeyUserSql(String column, String table, String columnValue, String condition) {
		// TODO Auto-generated method stub
		return dao.listByKeyUserHql(column,table,columnValue,condition);
	}

	@Override
	public List<T> listByAlias(String hql, Map<String, Object> alias) {
		return dao.listByAlias(hql, alias);
	}

	@Override
	public T getByParams(String hql, Map<String, Object> alias) {
		// TODO Auto-generated method stub
		return dao.getByParams(hql, alias);
	}

	@Override
	public Pager<T> find(String hql, Object[] args) {
		// TODO Auto-generated method stub
		return dao.find(hql, args);
	}

	@Override
	public Pager<T> find(String hql, Object arg) {
		// TODO Auto-generated method stub
		return dao.find(hql, arg);
	}

	@Override
	public Pager<T> find(String hql) {
		// TODO Auto-generated method stub
		return dao.find(hql);
	}

	@Override
	public Pager<T> find(String hql, Object[] args, Map<String, Object> alias) {
		// TODO Auto-generated method stub
		return dao.find(hql, args, alias);
	}

	@Override
	public Pager<T> findByAlias(String hql, Map<String, Object> alias) {
		// TODO Auto-generated method stub
		return dao.find(hql,null, alias);
	}

	@Override
	public Object queryObject(String hql, Object[] args) {
		// TODO Auto-generated method stub
		return dao.queryObject(hql, args);
	}

	@Override
	public Object queryObject(String hql, Object arg) {
		// TODO Auto-generated method stub
		return dao.queryObject(hql, arg);
	}

	@Override
	public Object queryObject(String hql) {
		// TODO Auto-generated method stub
		return dao.queryObject(hql);
	}

	@Override
	public void updateByHql(String hql, Object[] args) {
		// TODO Auto-generated method stub
		dao.updateByHql(hql, args);
	}

	@Override
	public void updateByHql(String hql, Object arg) {
		// TODO Auto-generated method stub
		dao.updateByHql(hql, arg);
	}

	@Override
	public void updateByHql(String hql) {
		// TODO Auto-generated method stub
		dao.updateByHql(hql);
	}

	@Override
	public <N> List<N> listBySql(String sql, Object[] args, Class<?> clz, boolean hasEntity) {
		// TODO Auto-generated method stub
		return dao.listBySql(sql, args, clz, hasEntity);
	}

	@Override
	public <N> List<N> listBySql(String sql, Object arg, Class<?> clz, boolean hasEntity) {
		// TODO Auto-generated method stub
		return dao.listBySql(sql, arg, clz, hasEntity);
	}

	@Override
	public <N> List<N> listBySql(String sql, Class<?> clz, boolean hasEntity) {
		// TODO Auto-generated method stub
		return dao.listBySql(sql, clz, hasEntity);
	}

	@Override
	public <N> List<N> listBySql(String sql, Object[] args, Map<String, Object> alias, Class<?> clz,
			boolean hasEntity) {
		// TODO Auto-generated method stub
		return dao.listBySql(sql, args, alias, clz, hasEntity);
	}

	@Override
	public <N> List<N> listByAliasSql(String sql, Map<String, Object> alias, Class<?> clz, boolean hasEntity) {
		// TODO Auto-generated method stub
		return dao.listByAliasSql(sql, alias, clz, hasEntity);
	}

	@Override
	public <N> Pager<N> findBySql(String sql, Object[] args, Class<?> clz, boolean hasEntity) {
		// TODO Auto-generated method stub
		return dao.findBySql(sql, args, clz, hasEntity);
	}

	@Override
	public <N> Pager<N> findBySql(String sql, Object arg, Class<?> clz, boolean hasEntity) {
		// TODO Auto-generated method stub
		return dao.findBySql(sql, arg, clz, hasEntity);
	}

	@Override
	public <N> Pager<N> findBySql(String sql, Class<?> clz, boolean hasEntity) {
		// TODO Auto-generated method stub
		return dao.findBySql(sql, clz, hasEntity);
	}

	@Override
	public <N> Pager<N> findBySql(String sql, Object[] args, Map<String, Object> alias, Class<?> clz,
			boolean hasEntity) {
		// TODO Auto-generated method stub
		return dao.findBySql(sql, args, alias, clz, hasEntity);
	}

	@Override
	public <N> Pager<N> findByAliasSql(String sql, Map<String, Object> alias, Class<?> clz, boolean hasEntity) {
		// TODO Auto-generated method stub
		return dao.findByAliasSql(sql, alias, clz, hasEntity);
	}

	@Override
	public Object queryObject(String hql, Object[] args, Map<String, Object> alias) {
		// TODO Auto-generated method stub
		return dao.queryObject(hql, args, alias);
	}

	@Override
	public Object queryObjectByAlias(String hql, Map<String, Object> alias) {
		// TODO Auto-generated method stub
		return dao.queryObjectByAlias(hql, alias);
	}

	@Override
	public T updateOnlyChange(T t) {
		// TODO Auto-generated method stub
		return dao.updateOnlyChange(t);
	}
}
