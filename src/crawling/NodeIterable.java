package crawling;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Deque;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

import org.jsoup.nodes.Node;

public class NodeIterable implements Iterable<Node> {

	private Node root;
	
	public NodeIterable(Node root) {
		this.root = root;
	}


	@Override
	public Iterator<Node> iterator() {
		return new NodeIterator(root);
	}
	
	public class NodeIterator implements Iterator<Node> {

		Deque<Node> stack;
		
		public NodeIterator(Node node) {
			stack = new ArrayDeque<Node>();
			stack.push(root);
		}

		@Override
		public boolean hasNext() {
			return !stack.isEmpty();
		}

		@Override
		public Node next() {
			if (stack.isEmpty()) {
				throw new NoSuchElementException();
			}
			
			Node node = stack.pop();
			List<Node> nodes = new ArrayList<Node>(node.childNodes());
			Collections.reverse(nodes);
			for (Node child : nodes) {
				stack.push(child);
			}
			return node;
		}
	}
}
