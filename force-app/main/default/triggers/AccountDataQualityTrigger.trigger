trigger AccountDataQualityTrigger on Account (before insert, before update) {

    if(Trigger.isBefore){
        AccountDataQualityHandler.processAccountData(Trigger.new);
    }
}