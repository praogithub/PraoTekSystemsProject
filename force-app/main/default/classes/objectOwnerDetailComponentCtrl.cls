public with sharing class objectOwnerDetailComponentCtrl {
   
   @AuraEnabled
   public static  User getRecordOwnerInfo(Id recordId){

        String objectName = recordId.getSobjectType().getDescribe().getName();
        String soql = 'Select  Id,Name,OwnerId from ' + objectName + ' where Id = :recordId Limit 1' ;
        Sobject rec = Database.query(soql);

        Id userId  =  (Id)rec.get('OwnerId');
        User userObj = [Select id,Name,SmallPhotoUrl, FullPhotoUrl
                From User
                Where Id =: userId Limit 1];
        return userObj;

    }

}
