import SwiftUI

struct Node: CustomStringConvertible, Hashable, Identifiable {
    var id: Self { self }
    var name: String
    var children: [Node]? = nil // must be an optional array
    var description: String { name }
}

let data = Node(name: "NHL", children: [
    Node(name: "Eastern Conference", children: [
        Node(name: "Atlantic Division", children: [
            Node(name: "Florida Panthers"),
            Node(name: "Buffalo Sabres"),
        ]),
        Node(name: "Metropolitan Division", children: [
            Node(name: "Carolina Hurricane"),
            Node(name: "Washington Capitals"),
        ])
    ])
])

struct ContentView: View {
    var body: some View {
        //TODO: Why doesn't this indent child nodes?
        OutlineGroup(data, id: \.name, children: \.children) { item in
            Text(item.description)
        }.padding(10)
        
        /*
        //TODO: Why does this give the following error?
        //TODO: Initializer requires that 'Node' conform to 'RandomAccessCollection'
        List(data, children: \.children) { item in
            Text(item.description)
        }.listStyle(InsetListStyle())
        //}.listStyle(SidebarListStyle())
        */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
