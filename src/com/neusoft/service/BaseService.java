package com.neusoft.service;


import java.util.List;
import java.util.Map;

import com.neusoft.utils.Pager;



public interface BaseService<T> {
	    public void save(T entity);  
	  
	    public void update(T entity); 
	    //只修改已经修改的属性
	    public T updateOnlyChange(T t);
	    public void delete(int id);  
	  
	    public T getById(int id);  
	  
	    public List<T> getByHQL(String hql, Map<String, Object> alias); 
	    
	    public T getOneByHql(String hql, Map<String, Object> alias);
	    
	    //指定某一列查询 例如 name User 张三  sex = 1
		public List<T> listByKeyUserHql(String column,String model,String columnValue,String condition);
		//指定某一列查询
			public List<T> listByKeyUserSql(String column,String table,String columnValue,String condition);
			
//			public List<T> list(String hql, Object[] args);
//			public List<T> list(String hql, Object arg);
//			public List<T> list(String hql);
//			public List<T> list(String hql, Object[] args, Map<String, Object> alias);
			public List<T> listByAlias(String hql, Map<String, Object> alias);
			public T getByParams(String hql, Map<String, Object> alias);
//			/**
//			 * 分页列表
//			 * @param hql
//			 * @param args
//			 * @return
//			 */
			public Pager<T> find(String hql, Object[] args);
			public Pager<T> find(String hql, Object arg);
			public Pager<T> find(String hql);
//			/**
//			 * 基于别名的查询
//			 * @param hql
//			 * @param args
//			 * @param alias
//			 * @return
//			 */
			public Pager<T> find(String hql, Object[] args, Map<String, Object> alias);
			public Pager<T> findByAlias(String hql, Map<String, Object> alias);
//			/**
//			 * 查询对象通过hql
//			 * @param hql
//			 * @param args
//			 * @return
//			 */
			public Object queryObject(String hql, Object[] args);
			public Object queryObject(String hql, Object arg);
			public Object queryObject(String hql);
//			/**
//			 * 根据hql更新对象
//			 * @param hql
//			 * @param args
//			 */
			public void updateByHql(String hql, Object[] args);
			public void updateByHql(String hql, Object arg);
			public void updateByHql(String hql);
//			/**
//			 * 基于sql查询
//			 * @param sql
//			 * @param args
//			 * @param clz
//			 * @param hasEntity
//			 * @return
//			 */
			public <N extends Object>List<N> listBySql(String sql, Object[] args, Class<?> clz,
					boolean hasEntity);
			public <N extends Object>List<N> listBySql(String sql, Object arg, Class<?> clz,
					boolean hasEntity);
			public <N extends Object>List<N> listBySql(String sql, Class<?> clz, boolean hasEntity);
			public <N extends Object>List<N> listBySql(String sql, Object[] args,
					Map<String, Object> alias, Class<?> clz, boolean hasEntity);
			public <N extends Object>List<N> listByAliasSql(String sql, Map<String, Object> alias,
					Class<?> clz, boolean hasEntity);
			public <N extends Object>Pager<N> findBySql(String sql, Object[] args, Class<?> clz,
					boolean hasEntity);
			public <N extends Object>Pager<N> findBySql(String sql, Object arg, Class<?> clz,
					boolean hasEntity);
			public <N extends Object>Pager<N> findBySql(String sql, Class<?> clz, boolean hasEntity);
			public <N extends Object>Pager<N> findBySql(String sql, Object[] args,
					Map<String, Object> alias, Class<?> clz, boolean hasEntity);
			public <N extends Object>Pager<N> findByAliasSql(String sql, Map<String, Object> alias,
					Class<?> clz, boolean hasEntity);
			public Object queryObject(String hql, Object[] args,
					Map<String, Object> alias) ;
			public Object queryObjectByAlias(String hql, Map<String, Object> alias);
}
