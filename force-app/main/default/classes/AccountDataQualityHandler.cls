public with sharing class AccountDataQualityHandler {
    public static void processAccountData(List<Account> accList){

        for(Account acc : accList){

            if(acc.Phone != null){
                String cleanedPhone = acc.Phone.replaceAll('[^0-9]', '');
                acc.Phone = cleanedPhone;
            
               if(cleanedPhone.length() == 10){
                    acc.Phone = '('+ cleanedPhone.substring(0,3) + ') ' + cleanedPhone.substring(3,6) + '-' + cleanedPhone.substring(6);    
               }
            }

            if(acc.Website != null){
                String websiteURL = acc.Website.toLowerCase();
                websiteURL = websiteURL.replace('www.', '');

                if(!websiteURL.startsWith('http://') && !websiteURL.startsWith('https://')){
                    acc.Website = 'http://' + websiteURL;
                }
                
            }

        }
    }
}