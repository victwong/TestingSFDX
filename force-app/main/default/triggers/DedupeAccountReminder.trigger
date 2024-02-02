trigger DedupeAccountReminder on Account (after insert) {
    for (Account acc : Trigger.new) {
        Case c      = new Case();
        c.OwnerId   = '00536000001ufP5';
        c.Subject   = 'Dedupe this Account';
        c.AccountId = acc.Id;
        insert c;
    }
}