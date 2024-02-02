public class queueableDemo implements Queueable
{
    public void execute(QueueableContext xyz)
    {
        system.debug('inside the queueable');
    }
}