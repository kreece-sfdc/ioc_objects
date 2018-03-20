public with sharing class IoC_Object_Helper 
{
    // WHERE clause for Checkmarx
	public static List<Concrete_Implementation__c> getAllImplementations()
    {
        return [SELECT Interface__c, Implementation__c FROM Concrete_Implementation__c WHERE Id != NULL];
    }
    
    public static Concrete_Implementation__c getImplementation(string p_interface)
    {
        List<Concrete_Implementation__c> items = [SELECT Interface__c, Implementation__c FROM Concrete_Implementation__c WHERE Interface__c = :p_interface];
        
        if(items.isEmpty())
        {
            throw new IoC_NoImplementationException();
        }
        
        return items.get(0);
    }
    
    public static void createImplementation(string p_interface, string p_implementation)
    {
        Concrete_Implementation__c ci = new Concrete_Implementation__c
            (
                Interface__c = p_interface,
                Implementation__c = p_implementation
            );
        
        database.upsert(ci, Concrete_Implementation__c.Interface__c);
    }
}