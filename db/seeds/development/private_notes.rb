puts 'Creating Private Notes'

l = Link.first

PrivateNote.create!(
  user_id: 42,
  title: 'First Note',
  body: 'this is a super short note',
  link_id: l.id
)

PrivateNote.create!(
  user_id: 69,
  title: 'My user id is 69',
  body: 'This note tells me nothing else besides the fact that my user id is 69 and I think that is funny because I am a child.',
  link_id: l.id
)

PrivateNote.create!(
  user_id: 42,
  title: 'Same link, new note',
  body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  link_id: l.id
)

PrivateNote.create!(
  user_id: 42,
  title: 'very very lorum ipsum',
  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam semper odio purus, quis mollis arcu sagittis nec. Mauris fermentum metus ac molestie molestie. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum nec malesuada velit. Sed feugiat nulla est, ac dignissim massa porttitor nec. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id urna varius, iaculis libero in, ullamcorper quam. Maecenas et eros bibendum, congue turpis nec, rhoncus ante. In at nisl quis mauris rhoncus ultricies. Fusce vel lobortis ipsum. Aliquam erat volutpat.

Mauris sodales sem ut erat fringilla suscipit pretium sit amet nibh. Curabitur volutpat leo nibh, nec pulvinar urna finibus ac. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc lobortis porta felis id efficitur. In at lacus et sem pretium lobortis in a est. Morbi ut urna eu mauris fermentum rutrum sit amet et velit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer bibendum placerat justo in interdum. Sed sed mauris ultrices, fermentum libero dictum, fermentum velit.

Nam non ligula elementum, condimentum ipsum ut, lacinia massa. Vivamus vel dolor ut mi tempus placerat non non elit. Mauris interdum urna nunc, ac imperdiet leo bibendum et. In viverra lacus sed venenatis sodales. Quisque magna dolor, pulvinar quis metus vel, maximus consectetur metus. Morbi convallis vel est in gravida. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec eget egestas arcu. Nunc quis ligula justo. Vivamus a nunc non purus condimentum ultrices et et neque. Phasellus quis molestie odio. Morbi risus nunc, venenatis vel semper ut, auctor porta dolor.

Vivamus tempus massa odio, ultricies interdum diam pellentesque a. Quisque nisl enim, scelerisque at condimentum id, ornare sit amet lacus. Sed vulputate mattis orci, vel rutrum lorem. Fusce sed consectetur ex, vitae tempor nunc. Phasellus pulvinar erat nec diam faucibus, quis molestie enim sodales. Integer sit amet nunc dignissim, euismod sapien sit amet, ultricies metus. Mauris placerat aliquet magna dictum vulputate. Donec lobortis, sem non auctor posuere, risus dui vestibulum mi, sed interdum ipsum nisl vel nibh. Nulla dapibus vel lorem in condimentum. Integer consequat elit augue. Cras sed purus orci. Aenean imperdiet sodales ante in auctor. Aliquam porta pharetra rhoncus. Pellentesque convallis quam tellus, a blandit sapien dictum et. Aenean eget blandit quam.

Donec ultricies tincidunt eros. Nullam ac libero eget dui facilisis vulputate. Mauris id velit luctus, sodales mi sit amet, egestas nunc. Etiam lobortis ipsum in nisi elementum, ut cursus leo sollicitudin. In mollis sodales vulputate. Nulla sed gravida eros. Pellentesque aliquam, nunc mattis placerat lobortis, nisl arcu ultrices enim, id malesuada nunc neque eget nisi. Sed et nisi et lorem mattis congue a id diam. In eu ipsum erat. Etiam vestibulum consequat erat.

Cras eget neque non enim finibus iaculis sed sit amet magna. Proin tincidunt facilisis cursus. Pellentesque ornare est in magna gravida, ac rutrum ex eleifend. Maecenas nisl orci, maximus ut velit non, congue posuere turpis. Fusce iaculis purus eget neque convallis tempor. Proin purus nulla, congue non leo a, tincidunt congue ligula. Sed quis sem velit. Cras nec augue sed dolor tincidunt mollis. Proin purus tellus, auctor vitae mi sit amet, lobortis aliquam quam. Donec iaculis magna quam, vulputate viverra erat auctor vel. Phasellus molestie faucibus ornare.

Generated 6 paragraphs, 547 words, 3615 bytes of Lorem Ipsum',
  link_id: Link.last.id
)
