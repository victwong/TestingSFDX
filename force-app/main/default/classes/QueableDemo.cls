public class QueableDemo implements Queueable {
    public void execute (QueueableContext context) 
    {
        Id jobId = context.getJobId();
        System.debug('QueableDemo');
    }
}