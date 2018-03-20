@isTest
public class IoC_Object_Helper_Test 
{
	@isTest
    static void TestCreate()
    {
        IoC_Object_Helper.createImplementation('IFiles', 'Core_Files');
        
        integer count = [SELECT count() FROM Concrete_Implementation__c];
        
        system.assertEquals(1, count);
    }
    
    @isTest
    static void TestGetAll()
    {
        IoC_Object_Helper.createImplementation('IFiles', 'Core_Files');
        
        List<Concrete_Implementation__c> items = IoC_Object_Helper.getAllImplementations();
        
        system.assertEquals(1, items.size());
    }
    
    @isTest
    static void TestGetSingle()
    {
        IoC_Object_Helper.createImplementation('IFiles', 'Core_Files');
        
        Concrete_Implementation__c item = IoC_Object_Helper.getImplementation('IFiles');
        
        system.assertEquals('Core_Files', item.Implementation__c);
    }
    
    @isTest
    static void TestGetSingleException()
    {
        try
        {
	        Concrete_Implementation__c item = IoC_Object_Helper.getImplementation('IFiles');

			system.assert(false);
        }
		catch(IoC_NoImplementationException ex)
        {
            system.assert(true);
        }
    }
}