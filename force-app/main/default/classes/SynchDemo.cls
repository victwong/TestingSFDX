public class SynchDemo 
{
    public static void synchMethod()
    {
        System.debug('insidesynchMethod');
        System.debug('executingqueueable');
        Id jobId = System.enqueueJob(new QueableDemo());
        AsyncApexJob job = [Select Id, status, JobType From AsyncApexJob where Id=:jobId limit 1];
        System.debug(job);
    }
}