trigger HelloWorldLead on Lead (before insert, before update) {
    for (Lead l : Trigger.new){
        l.FirstName = 'Hello';
        l.LastName = 'World';
    }
}