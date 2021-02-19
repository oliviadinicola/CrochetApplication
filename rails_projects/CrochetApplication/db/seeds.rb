# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "user123@gmail.com", password:"password", username: "user123")
puts user 

projects = ['Bee', 'Bear', 'Sweater', 'Hat']
projects.each{|project| p = Project.create(name: project,
                                     instructions: "Crochet #{project} pattern. Yarn over the hook and then insert the hook into the chain. On this first stitch, you are going to insert the hook into the third chain from your hook. Those chains that you are skipping are what serve as your first double crochet of the row, although you probably won't be able to see this until you've completed the next stitch. That is the reason that you add those extra chains to the foundation chain as described above, though, because they help create the chains that become the first double crochet.
For now, though, you can just trust that this is the way that you do it, so yarn over and insert the hook into the third chain from the hook.",
                                     yarn_size: 4, 
                                     difficulty: 3,
                                     hook_size: 6,
                                     user: User.first
    )
    puts p if p.save
}
