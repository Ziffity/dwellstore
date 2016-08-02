package mystore.taxcalculator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import atg.commerce.claimable.ClaimableTools;
import atg.commerce.pricing.ItemPriceInfo;
import atg.commerce.pricing.OrderPriceInfo;
import atg.commerce.pricing.PricingAdjustment;
import atg.commerce.promotion.PromotionTools;
import atg.nucleus.GenericService;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.projects.store.order.StoreOrderImpl;
import atg.commerce.order.CommerceItemImpl;

public class MystoreTaxManager extends GenericService {

	PromotionTools promotionTools;
	ClaimableTools claimableTools;

	public PromotionTools getPromotionTools() {
		return promotionTools;
	}

	public void setPromotionTools(PromotionTools promotionTools) {
		this.promotionTools = promotionTools;
	}

	public ClaimableTools getClaimableTools() {
		return claimableTools;
	}

	public void setClaimableTools(ClaimableTools claimableTools) {
		this.claimableTools = claimableTools;
	}

	@SuppressWarnings({ "unchecked" })
	public double getTaxForOrder(StoreOrderImpl order) {
		System.out.println("******Inside tax manager class");
		double taxOnItems = 0.0D;
		double otherPromoAdjustments = 0;

		List<RepositoryItem> activePromotions = null;
		Map<String, RepositoryItem> appliedPromoCoupons = new HashMap<String, RepositoryItem>();

		OrderPriceInfo orderPriceInfo = (OrderPriceInfo) order.getPriceInfo();
		List<PricingAdjustment> orderPriceInfoAdjustments = orderPriceInfo
				.getAdjustments();

		try {
			activePromotions = (List<RepositoryItem>) getPromotionTools()
					.getProfile(order.getProfileId()).getPropertyValue(
							"activePromotions");
		} catch (RepositoryException e) {
			vlogDebug("getting active promotions from profile", e.getMessage());
		}

		for (RepositoryItem promotionStatus : activePromotions) {
			List<RepositoryItem> coupons = (List<RepositoryItem>) promotionStatus
					.getPropertyValue("coupons");
			RepositoryItem promotion = (RepositoryItem) promotionStatus
					.getPropertyValue("promotion");
			appliedPromoCoupons
					.put(promotion.getRepositoryId(), coupons.get(0));
		}

		for (PricingAdjustment adjustment : orderPriceInfoAdjustments) {
			if (null != adjustment.getPricingModel()) {
				RepositoryItem coupon = appliedPromoCoupons.get(adjustment
						.getPricingModel().getRepositoryId());
				if (null == coupon) {
					if (adjustment.getTotalAdjustment() < 0) {
						otherPromoAdjustments += adjustment
								.getTotalAdjustment() * -1;
					} else {
						otherPromoAdjustments += adjustment
								.getTotalAdjustment();
					}

				}
			}
		}
			List<CommerceItemImpl> commerceItems = order.getCommerceItems();
			
			for (CommerceItemImpl commerceItemImpl : commerceItems) {
				ItemPriceInfo itemPriceInfo = commerceItemImpl.getPriceInfo();
				List<PricingAdjustment> itemPriceInfoAdjustments = itemPriceInfo.getAdjustments();
				for (PricingAdjustment adjustment : itemPriceInfoAdjustments) {
					if(null != adjustment.getPricingModel()) {
						RepositoryItem coupon = appliedPromoCoupons.get(adjustment.getPricingModel().getRepositoryId());
						if(null == coupon){
						if(adjustment.getTotalAdjustment() < 0) {
							otherPromoAdjustments += adjustment.getTotalAdjustment() * -1;
						} else {
							otherPromoAdjustments += adjustment.getTotalAdjustment();
						}
					}
				}
			}
				taxOnItems = orderPriceInfo.getAmount() + otherPromoAdjustments;
		}
		return taxOnItems;
	}
}