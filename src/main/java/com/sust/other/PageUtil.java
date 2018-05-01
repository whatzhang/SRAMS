package com.sust.other;

import java.util.Collections;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PageUtil<T> {
	
	private static final Log logger = LogFactory.getLog(PageUtil.class);
    //原集合
    private List<T> data;
    //上一页
    private int lastPage;
    //第一页
    private int firstPage;
    //起始条数
    private int startRow;
    //末尾条数
    private int endRow;
    //上一页
    private int prePage;
    //当前页 
    private int nowPage;
    //下一页
    private int nextPage;
    //每页条数 
    private int pageSize;
    //总页数 
	private int totalPage;
    //总数据条数 
    private int totalCount;
    
    public PageUtil(List<T> data,int nowPage,int pageSize) {
        if (data == null || data.isEmpty()) {
           logger.warn("list 不能为空");
        }
        this.data = data;
        this.pageSize = pageSize;
        
        this.totalCount = data.size();
        this.totalPage = (totalCount + pageSize - 1) / pageSize;
        
        this.firstPage = 1;
        this.prePage = nowPage-1<1?1:nowPage-1;
        this.nowPage = nowPage;
        this.nextPage = nowPage>=totalPage? totalPage: nowPage + 1;
        this.lastPage = totalPage;   
        
        this.startRow = nowPage * pageSize - (pageSize-1);
        this.endRow = nowPage == lastPage? totalCount:nowPage * pageSize;
    }
 
    /**
     * 得到分页后的数据
     * @param pageNum 页码
     * @return 分页后结果
     */
    public List<T> getPagedList() {
        int fromIndex = (nowPage - 1) * pageSize;
        if (fromIndex >= data.size()) {
            return Collections.emptyList();//空数组
        }
        if(fromIndex<0){
            return Collections.emptyList();//空数组
        }
        int toIndex = nowPage * pageSize;
        if (toIndex >= data.size()) {
            toIndex = data.size();
        }
        return data.subList(fromIndex, toIndex);
    }
 
    public int getPageSize() {
        return pageSize;
    }
 
    public List<T> getData() {
        return data;
    }
    public int getLastPage() {
        return lastPage;
    }

    public int getNowPage() {
        return nowPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getPrePage() {
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	@Override
	public String toString() {
		return "PageUtil [lastPage=" + lastPage + ", firstPage=" + firstPage + ", startRow="
				+ startRow + ", endRow=" + endRow + ", prePage=" + prePage + ", nowPage=" + nowPage + ", nextPage="
				+ nextPage + ", pageSize=" + pageSize + ", totalPage=" + totalPage + ", totalCount=" + totalCount + "]";
	}
	
}
