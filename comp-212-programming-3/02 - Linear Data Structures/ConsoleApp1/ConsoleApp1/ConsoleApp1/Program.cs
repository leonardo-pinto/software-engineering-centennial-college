public class Week2Examples
{
    public static void Main(string[] args)
    {
        Console.WriteLine("Week2");

        Node firstNode = new Node(15);
        Console.WriteLine(firstNode.Data);
        Console.WriteLine(firstNode.Next == null ? "Yes" : "No");

        Node secondNode = new Node(10);
        Console.WriteLine(secondNode.Data);
        Console.WriteLine(secondNode.Next == null ? "Yes" : "No");
        LinkedList<Node> list = new LinkedList<Node>();
        firstNode.Next = secondNode;
        Console.WriteLine(firstNode.Next == null ? "Yes" : "No");

        Console.WriteLine(firstNode.Data);
        Console.WriteLine(firstNode.Next == null ? "Yes" : firstNode.Next.Data);

        LinkedList<int> linkedList = new LinkedList<int>();

    }
}

public class Node
{
    public int Data { get; set; }
    public Node? Next { get; set; }

    public Node(int Data)
    {
        this.Data = Data;
    }
}

