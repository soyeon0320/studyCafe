package kr.co.scm.common.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import kr.co.scm.common.vo.KakaoPayApprovalVO;
import kr.co.scm.common.vo.KakaoPayCancelApprovalVO;
import kr.co.scm.common.vo.KakaoPayCancelVO;
import kr.co.scm.common.vo.KakaoPayReadyVO;


@Service("kakoPayService")
public class KakaopayService {

	private static final String HOST = "https://kapi.kakao.com";

	private static final String ADMIN_KEY = "92d6d22ada8931e12553ea9ece919c49";

	private KakaoPayReadyVO payReadyVO;

	public String kakaoPayReady(KakaoPayReadyVO readyVO) {

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + ADMIN_KEY);
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", readyVO.getCid());
		params.add("partner_order_id", readyVO.getPartner_order_id());
		params.add("partner_user_id",readyVO.getPartner_user_id());
		params.add("item_name", readyVO.getItem_name());
		params.add("quantity", String.valueOf(readyVO.getQuantity()));
		params.add("total_amount", String.valueOf(readyVO.getTotal_amount()));
		params.add("tax_free_amount", String.valueOf(readyVO.getTax_free_amount()));
		params.add("approval_url", readyVO.getApproval_url());
		params.add("cancel_url", readyVO.getCancel_url());
		params.add("fail_url", readyVO.getFail_url());

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			payReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
			BeanUtils.copyProperties(readyVO, payReadyVO, "tid","created_at","next_redirect_pc_url");


			return payReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		return "/pay";

	}



	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + ADMIN_KEY);
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", payReadyVO.getCid());
		params.add("tid", payReadyVO.getTid());
		params.add("partner_order_id", payReadyVO.getPartner_order_id());
		params.add("partner_user_id", payReadyVO.getPartner_user_id());
		params.add("pg_token", pg_token);
		params.add("total_amount", String.valueOf(payReadyVO.getTotal_amount()));

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			KakaoPayApprovalVO approvalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);

			return approvalVO;

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		return null;
	}



	public KakaoPayCancelApprovalVO kakaoPayCancel(KakaoPayCancelVO cancelVO) {

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + ADMIN_KEY);
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", cancelVO.getCid());
		params.add("tid", cancelVO.getTid());
		params.add("cancel_amount", String.valueOf(cancelVO.getCancel_amount()));
		params.add("cancel_tax_free_amount", String.valueOf(cancelVO.getCancel_tax_free_amount()));

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			KakaoPayCancelApprovalVO approvalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body, KakaoPayCancelApprovalVO.class);

			return approvalVO;

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		return null;
		
		
	}
}
