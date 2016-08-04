package atg.commerce.endeca.cache;

import java.util.List;

import java.util.concurrent.ConcurrentHashMap;


import atg.projects.store.cache.StoreDimensionValueCacheTools;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.ServletUtil;

public class MystoreDimensionValueCacheTools extends StoreDimensionValueCacheTools {
	
	private boolean loggingAdditionalInfo;
	private DimensionValueCache oldRequestCache;
	private boolean enableSwapCheck=false;

	public MystoreDimensionValueCache createEmptyCache() {
		return new MystoreDimensionValueCache();
	}

	public void updateCache(String pRepositoryId, String pDimvalId,
			String pURL, List<String> pAncestorRepositoryIds)
	{
		System.out.println("*******Inside DimentionValueCacheTools****");
		vlogInfo(
				"Starting  dimension value cache update for dim val id : {0} ",
				new Object[] { pDimvalId });
		String key = getAssemblerApplicationConfiguration()
				.getCurrentApplicationKey();
		DimensionValueCacheTools.CacheRefreshLock lock = getCacheRefreshLock(key);
		if (lock.isUpdating()) {
			vlogWarning(
					"UpdateCache Message : Cache refresh already underway for cache {0}, this refresh will be cancelled.",
					new Object[] { key });
			return;
		}
		try {
			synchronized (lock) {
				if (lock.isUpdating()) {
					vlogWarning(
							"UpdateCache Message : Cache refresh already underway for cache {0}, this refresh will be cancelled.",
							new Object[] { key });
					return;
				}
				lock.setUpdating(true);
				getCache().put(pRepositoryId, pDimvalId, pURL, null);
				System.out.println("*******DimentionValue****:"+pDimvalId);
			}
		} catch (Exception e) {
			vlogError("Error occured while updating dimVal with Id {0}",
					new Object[] { key }, e);
		} finally {
			lock.setUpdating(false);
		}

	}

	@Override
	public void fillEmptyCache() {
		String key = getAssemblerApplicationConfiguration()
				.getCurrentApplicationKey();
		DimensionValueCacheTools.CacheRefreshLock lock = getCacheRefreshLock(key);
		if (lock.isUpdating()) {
			lock.setUpdating(false);
			// getAcclConfiguration().setFirstTimeEndecaUpdateOnLockDone(true);
			vlogWarning(
					"DVCT_Forcefully updating the lock to false to do first time cache update",
					new Object[] {});
		}
		super.fillEmptyCache();
	}

	public void swapCache(DimensionValueCache pOfflineCache) {
		if(isLoggingAdditionalInfo())
			logDebug("****************Entering Swap Cache ******************");
		if(isLoggingAdditionalInfo()){
			logDebug("****************Printing New Cache ******************");
			printCache(pOfflineCache);
			logDebug("****************New Cache print completed ******************");
		}
		int newCacheEntrySize = pOfflineCache.getNumCacheEntries();
		if(isLoggingAdditionalInfo())
			logDebug("Original Cache size : "+newCacheEntrySize);
		
		String key = getAssemblerApplicationConfiguration().getCurrentApplicationKey();
		if(getCacheBeforeUpdate()!=null){
			DimensionValueCache oldCache=getCacheBeforeUpdate();
			if(isLoggingAdditionalInfo()){
				logDebug("****************Printing Current Cache Map******************");
				printCache(oldCache);
				logDebug("****************Current Cache Map print completed ******************");
			}
			if(newCacheEntrySize>=oldCache.getNumCacheEntries() && isEnableSwapCheck()){
				super.swapCache(pOfflineCache);
				return;
			}
		}
		super.swapCache(pOfflineCache);
	}
	
	@Override
	public void refreshCache() {
	//	setOldRequestCache(getCache());
		super.refreshCache();
	}
	
	 public String printCache(DimensionValueCache dimValCache)
	    {
	      StringBuilder sb = new StringBuilder();
	      sb.append(dimValCache.printCache());
	      vlogInfo(sb.toString(), new Object[0]);
	      return sb.toString();
	    }

	public DimensionValueCache getCacheBeforeUpdate() {
		DynamoHttpServletRequest reqCurr = ServletUtil.getCurrentRequest();
		DimensionValueCache reqCache = getCacheFromRequest(reqCurr);
		return reqCache;
		
	}

	public boolean isLoggingAdditionalInfo() {
		return loggingAdditionalInfo;
	}

	public void setLoggingAdditionalInfo(boolean loggingAdditionalInfo) {
		this.loggingAdditionalInfo = loggingAdditionalInfo;
	}

	/**
	 * @return the oldRequestCache
	 */
	public DimensionValueCache getOldRequestCache() {
		return oldRequestCache;
	}

	/**
	 * @param oldRequestCache the oldRequestCache to set
	 */
	public void setOldRequestCache(DimensionValueCache oldRequestCache) {
		this.oldRequestCache = oldRequestCache;
	}

	/**
	 * @return the enableSwapCheck
	 */
	public boolean isEnableSwapCheck() {
		return enableSwapCheck;
	}

	/**
	 * @param enableSwapCheck the enableSwapCheck to set
	 */
	public void setEnableSwapCheck(boolean enableSwapCheck) {
		this.enableSwapCheck = enableSwapCheck;
	}

}

