-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2023 at 02:07 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogy`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teaser` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `category_id`, `picture`, `title`, `slug`, `teaser`, `body`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, 'Unde esse qui ut.', 'unde-esse-qui-ut', 'Id fugit voluptatem officia ipsum.', '# Welcome to StackEdit!\n\nHi! I\'m your first Markdown file in **StackEdit**. If you want to learn about StackEdit, you can read me. If you want to play with Markdown, you can edit me. Once you have finished with me, you can create new files by opening the **file explorer** on the left corner of the navigation bar.\n\n\n# Files\n\nStackEdit stores your files in your browser, which means all your files are automatically saved locally and are accessible **offline!**\n\n```php\nimport { useEffect, React } from  \"react\";\n\nimport hljs from  \"highlight.js\";\n\nimport { marked } from  \"marked\";\n\n  \n\nexport  default  function Markdown({ children }) {\n\nuseEffect(() => {\n\n	hljs.highlightAll();\n\n	}, []);\n\nreturn  <div  dangerouslySetInnerHTML={{ __html: marked(children) }}  />;\n\n}\n```\n\n## Create files and folders\n\nThe file explorer is accessible using the button in left corner of the navigation bar. You can create a new file by clicking the **New file** button in the file explorer. You can also create folders by clicking the **New folder** button.\n\n## Switch to another file\n\nAll your files and folders are presented as a tree in the file explorer. You can switch from one to another by clicking a file in the tree.\n\n## Rename a file\n\nYou can rename the current file by clicking the file name in the navigation bar or by clicking the **Rename** button in the file explorer.\n\n## Delete a file\n\nYou can delete the current file by clicking the **Remove** button in the file explorer. The file will be moved into the **Trash** folder and automatically deleted after 7 days of inactivity.\n\n## Export a file\n\nYou can export the current file by clicking **Export to disk** in the menu. You can choose to export the file as plain Markdown, as HTML using a Handlebars template or as a PDF.\n\n\n# Synchronization\n\nSynchronization is one of the biggest features of StackEdit. It enables you to synchronize any file in your workspace with other files stored in your **Google Drive**, your **Dropbox** and your **GitHub** accounts. This allows you to keep writing on other devices, collaborate with people you share the file with, integrate easily into your workflow... The synchronization mechanism takes place every minute in the background, downloading, merging, and uploading file modifications.\n\nThere are two types of synchronization and they can complement each other:\n\n- The workspace synchronization will sync all your files, folders and settings automatically. This will allow you to fetch your workspace on any other device.\n	> To start syncing your workspace, just sign in with Google in the menu.\n\n- The file synchronization will keep one file of the workspace synced with one or multiple files in **Google Drive**, **Dropbox** or **GitHub**.\n	> Before starting to sync files, you must link an account in the **Synchronize** sub-menu.\n\n## Open a file\n\nYou can open a file from **Google Drive**, **Dropbox** or **GitHub** by opening the **Synchronize** sub-menu and clicking **Open from**. Once opened in the workspace, any modification in the file will be automatically synced.\n\n## Save a file\n\nYou can save any file of the workspace to **Google Drive**, **Dropbox** or **GitHub** by opening the **Synchronize** sub-menu and clicking **Save on**. Even if a file in the workspace is already synced, you can save it to another location. StackEdit can sync one file with multiple locations and accounts.\n\n## Synchronize a file\n\nOnce your file is linked to a synchronized location, StackEdit will periodically synchronize it by downloading/uploading any modification. A merge will be performed if necessary and conflicts will be resolved.\n\nIf you just have modified your file and you want to force syncing, click the **Synchronize now** button in the navigation bar.\n\n> **Note:** The **Synchronize now** button is disabled if you have no file to synchronize.\n\n## Manage file synchronization\n\nSince one file can be synced with multiple locations, you can list and manage synchronized locations by clicking **File synchronization** in the **Synchronize** sub-menu. This allows you to list and remove synchronized locations that are linked to your file.\n\n\n# Publication\n\nPublishing in StackEdit makes it simple for you to publish online your files. Once you\'re happy with a file, you can publish it to different hosting platforms like **Blogger**, **Dropbox**, **Gist**, **GitHub**, **Google Drive**, **WordPress** and **Zendesk**. With [Handlebars templates](http://handlebarsjs.com/), you have full control over what you export.\n\n> Before starting to publish, you must link an account in the **Publish** sub-menu.\n\n## Publish a File\n\nYou can publish your file by opening the **Publish** sub-menu and by clicking **Publish to**. For some locations, you can choose between the following formats:\n\n- Markdown: publish the Markdown text on a website that can interpret it (**GitHub** for instance),\n- HTML: publish the file converted to HTML via a Handlebars template (on a blog for example).\n\n## Update a publication\n\nAfter publishing, StackEdit keeps your file linked to that publication which makes it easy for you to re-publish it. Once you have modified your file and you want to update your publication, click on the **Publish now** button in the navigation bar.\n\n> **Note:** The **Publish now** button is disabled if your file has not been published yet.\n\n## Manage file publication\n\nSince one file can be published to multiple locations, you can list and manage publish locations by clicking **File publication** in the **Publish** sub-menu. This allows you to list and remove publication locations that are linked to your file.\n\n\n# Markdown extensions\n\nStackEdit extends the standard Markdown syntax by adding extra **Markdown extensions**, providing you with some nice features.\n\n> **ProTip:** You can disable any **Markdown extension** in the **File properties** dialog.\n\n\n## SmartyPants\n\nSmartyPants converts ASCII punctuation characters into \"smart\" typographic punctuation HTML entities. For example:\n\n|                |ASCII                          |HTML                         |\n|----------------|-------------------------------|-----------------------------|\n|Single backticks|`\'Isn\'t this fun?\'`            |\'Isn\'t this fun?\'            |\n|Quotes          |`\"Isn\'t this fun?\"`            |\"Isn\'t this fun?\"            |\n|Dashes          |`-- is en-dash, --- is em-dash`|-- is en-dash, --- is em-dash|\n\n\n## KaTeX\n\nYou can render LaTeX mathematical expressions using [KaTeX](https://khan.github.io/KaTeX/):\n\nThe *Gamma function* satisfying $\\Gamma(n) = (n-1)!\\quad\\forall n\\in\\mathbb N$ is via the Euler integral\n\n$$\n\\Gamma(z) = \\int_0^\\infty t^{z-1}e^{-t}dt\\,.\n$$\n\n> You can find more information about **LaTeX** mathematical expressions [here](http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference).\n\n\n## UML diagrams\n\nYou can render UML diagrams using [Mermaid](https://mermaidjs.github.io/). For example, this will produce a sequence diagram:\n\n```mermaid\nsequenceDiagram\nAlice ->> Bob: Hello Bob, how are you?\nBob-->>John: How about you John?\nBob--x Alice: I am good thanks!\nBob-x John: I am good thanks!\nNote right of John: Bob thinks a long<br/>long time, so long<br/>that the text does<br/>not fit on a row.\n\nBob-->Alice: Checking with John...\nAlice->John: Yes... John, how are you?\n```\n\nAnd this will produce a flow chart:\n\n```mermaid\ngraph LR\nA[Square Rect] -- Link text --> B((Circle))\nA --> C(Round Rect)\nB --> D{Rhombus}\nC --> D\n\n```', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(2, 2, 3, NULL, 'Perferendis iusto qui ea et possimus sit.', 'perferendis-iusto-qui-ea-et-possimus-sit', 'Accusantium ea quis qui tempore.', 'Voluptatibus distinctio est illo reprehenderit.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(3, 1, 3, NULL, 'Error recusandae asperiores placeat aliquid earum in.', 'error-recusandae-asperiores-placeat-aliquid-earum-in', 'Perferendis quas earum enim aut corporis.', 'Id aut omnis adipisci rerum.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(4, 2, 1, NULL, 'Possimus quas et itaque et.', 'possimus-quas-et-itaque-et', 'Perspiciatis similique sit natus sint nostrum odit assumenda temporibus.', 'Aut possimus ducimus qui ex reiciendis ut.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(5, 2, 1, NULL, 'Accusantium temporibus ut eos illo doloribus quas.', 'accusantium-temporibus-ut-eos-illo-doloribus-quas', 'Error nisi aperiam eaque molestiae.', 'Quia in et iure atque aliquid sunt sed.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(6, 2, 2, NULL, 'Qui officiis distinctio voluptatem perspiciatis voluptatem sit.', 'qui-officiis-distinctio-voluptatem-perspiciatis-voluptatem-sit', 'Provident cupiditate delectus et qui cum accusantium.', 'Voluptates quo ea est nulla enim.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(7, 2, 3, NULL, 'Et aspernatur sunt eum blanditiis mollitia nemo tenetur cupiditate.', 'et-aspernatur-sunt-eum-blanditiis-mollitia-nemo-tenetur-cupiditate', 'Maiores voluptatem illum est a ea.', 'Doloremque autem modi officia quis.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(8, 2, 2, NULL, 'Sit eos nemo facilis rerum nihil asperiores reprehenderit.', 'sit-eos-nemo-facilis-rerum-nihil-asperiores-reprehenderit', 'Similique enim eligendi voluptas accusamus et expedita.', 'Et autem soluta ab.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(9, 2, 2, NULL, 'Et perspiciatis architecto voluptas molestias aspernatur sit quos eum.', 'et-perspiciatis-architecto-voluptas-molestias-aspernatur-sit-quos-eum', 'Dolores repudiandae suscipit nobis quaerat quo cumque.', 'Porro molestiae expedita quia nemo aut.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(10, 2, 3, NULL, 'Beatae aut sit eaque aperiam occaecati in.', 'beatae-aut-sit-eaque-aperiam-occaecati-in', 'Dolorem sit non alias veniam sint aspernatur.', 'Labore necessitatibus id sed aperiam.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(11, 2, 2, NULL, 'Eligendi perferendis eos sed voluptatem.', 'eligendi-perferendis-eos-sed-voluptatem', 'Earum laboriosam nostrum perspiciatis unde voluptatem quia et.', 'Cum reprehenderit corrupti facere cum aperiam sunt blanditiis.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(12, 2, 2, NULL, 'Et dolores sint nisi beatae eum eos ipsum quod.', 'et-dolores-sint-nisi-beatae-eum-eos-ipsum-quod', 'Id est minima consectetur voluptas quo.', 'Adipisci magni non ab sed fuga quis.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(13, 2, 3, NULL, 'Quia perspiciatis deserunt vitae quia.', 'quia-perspiciatis-deserunt-vitae-quia', 'Itaque fugit rerum facere omnis molestiae eum.', 'Quaerat laboriosam sed qui fuga.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(14, 2, 1, NULL, 'Consequatur omnis illo ut doloremque ipsam id hic quam.', 'consequatur-omnis-illo-ut-doloremque-ipsam-id-hic-quam', 'Laudantium et et fuga et.', 'Quae est illo dolores qui nostrum.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(15, 2, 2, NULL, 'Eos facere adipisci eligendi numquam cumque reprehenderit.', 'eos-facere-adipisci-eligendi-numquam-cumque-reprehenderit', 'Eveniet consequatur temporibus accusantium omnis aut sunt odio.', 'Amet in nulla similique reprehenderit.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(16, 3, 1, NULL, 'Voluptatibus ad nulla consectetur dolore.', 'voluptatibus-ad-nulla-consectetur-dolore', 'Et totam commodi quis.', 'Temporibus perferendis laudantium quis vel harum.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(17, 3, 2, NULL, 'Et sit veritatis odit rerum.', 'et-sit-veritatis-odit-rerum', 'Similique dolore voluptatem voluptatum in.', 'Illum libero voluptas sit ut ipsum.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(18, 3, 1, NULL, 'Veritatis itaque blanditiis ab doloremque sed id.', 'veritatis-itaque-blanditiis-ab-doloremque-sed-id', 'Sit fugit exercitationem perferendis quis ut aut.', 'Quibusdam odit sit debitis voluptatum id qui ut quisquam.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(19, 3, 3, NULL, 'Consequatur facere velit tempore nobis.', 'consequatur-facere-velit-tempore-nobis', 'Qui eveniet voluptates omnis assumenda.', 'Excepturi in officiis recusandae sit vel et.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(20, 1, 3, NULL, 'Similique molestiae ea dolorem ipsa saepe est.', 'similique-molestiae-ea-dolorem-ipsa-saepe-est', 'Maiores facilis neque rerum rerum.', 'Eum eum suscipit et dicta ut sit harum.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(21, 3, 3, NULL, 'Mollitia qui sunt illo non sint ab sint illo.', 'mollitia-qui-sunt-illo-non-sint-ab-sint-illo', 'Cumque inventore qui esse reprehenderit aut.', 'Officia modi cupiditate ut corporis voluptas.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(22, 3, 1, NULL, 'Nihil suscipit eveniet eum et nesciunt.', 'nihil-suscipit-eveniet-eum-et-nesciunt', 'Earum id temporibus porro eos autem hic tempora.', 'Eligendi repudiandae maiores ab neque omnis.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(23, 3, 3, NULL, 'Repudiandae laboriosam at quia qui aperiam earum dignissimos.', 'repudiandae-laboriosam-at-quia-qui-aperiam-earum-dignissimos', 'Dignissimos nihil est nihil veritatis dolores.', 'Ea est est est rem perferendis.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(24, 1, 1, NULL, 'Molestias sunt omnis nostrum laboriosam enim atque.', 'molestias-sunt-omnis-nostrum-laboriosam-enim-atque', 'Nisi sit cupiditate nesciunt.', 'Non possimus et amet rem ut qui et et.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(25, 3, 3, NULL, 'Qui distinctio laboriosam esse eos dolorem voluptatum.', 'qui-distinctio-laboriosam-esse-eos-dolorem-voluptatum', 'Vero exercitationem atque saepe sequi ea magnam ab necessitatibus.', 'Molestias eligendi culpa iste ut nihil necessitatibus.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(26, 3, 2, NULL, 'Commodi cupiditate quia modi voluptatum veniam accusantium a.', 'commodi-cupiditate-quia-modi-voluptatum-veniam-accusantium-a', 'Asperiores voluptas et modi repudiandae fugiat odit.', 'Quasi voluptas iure sed culpa.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(27, 3, 1, NULL, 'Eos eos reiciendis cumque sequi.', 'eos-eos-reiciendis-cumque-sequi', 'Voluptas consequatur qui sapiente dolor voluptatem doloremque velit.', 'Et accusantium quae atque fugiat quibusdam.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(28, 3, 1, NULL, 'Quas sit rerum distinctio eos eius.', 'quas-sit-rerum-distinctio-eos-eius', 'Molestiae beatae dolores ut repudiandae reiciendis et.', 'Quo ut qui minus nostrum autem deleniti.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(29, 3, 2, NULL, 'Expedita quo velit soluta ex aperiam fugit.', 'expedita-quo-velit-soluta-ex-aperiam-fugit', 'Eligendi similique sit non eum quod.', 'Tenetur maxime et nihil perferendis asperiores eligendi.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(30, 3, 2, NULL, 'Aut voluptatem voluptatem earum laboriosam fugit beatae.', 'aut-voluptatem-voluptatem-earum-laboriosam-fugit-beatae', 'Esse commodi rem aut et tempora est.', 'Rerum ducimus repellat reprehenderit quis repellat.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(31, 4, 1, NULL, 'Neque ut repellat ea autem.', 'neque-ut-repellat-ea-autem', 'Dolore culpa quo aliquam exercitationem harum est.', 'Voluptates natus a facere.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(32, 4, 2, NULL, 'Qui ab vel quae voluptas quae.', 'qui-ab-vel-quae-voluptas-quae', 'Velit consequuntur esse suscipit id.', 'Quo occaecati et inventore libero reprehenderit eveniet.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(33, 4, 1, NULL, 'Voluptatem veritatis voluptatem voluptas aut.', 'voluptatem-veritatis-voluptatem-voluptas-aut', 'Aliquid optio sit et ut porro qui fugit.', 'Voluptatibus magni provident id.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(34, 4, 1, NULL, 'Fugiat eum neque sed inventore animi dolor.', 'fugiat-eum-neque-sed-inventore-animi-dolor', 'Animi qui commodi excepturi quam non suscipit a qui.', 'Necessitatibus rerum reprehenderit odit ducimus sunt commodi numquam.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(35, 4, 3, NULL, 'Praesentium accusantium assumenda fugiat sunt in sit.', 'praesentium-accusantium-assumenda-fugiat-sunt-in-sit', 'Nesciunt quaerat sed dolorem voluptatum.', 'Et et vel omnis doloremque.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(36, 4, 3, NULL, 'Voluptatibus aspernatur numquam sequi non quos tempore aut.', 'voluptatibus-aspernatur-numquam-sequi-non-quos-tempore-aut', 'Necessitatibus reiciendis voluptas culpa.', 'Aperiam voluptas voluptates impedit accusantium libero.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(37, 4, 1, NULL, 'Non labore dolor ut quae et.', 'non-labore-dolor-ut-quae-et', 'Unde aliquam facere porro illo.', 'Ex animi eum odio et illum.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(38, 4, 2, NULL, 'Sit natus et voluptatibus quia aperiam aliquid ipsam et.', 'sit-natus-et-voluptatibus-quia-aperiam-aliquid-ipsam-et', 'Suscipit tempora sequi accusantium est sequi officiis voluptatem.', 'Ipsum reiciendis et aut doloribus et vero.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(39, 4, 1, NULL, 'Eos est maxime rerum nostrum cum cumque adipisci.', 'eos-est-maxime-rerum-nostrum-cum-cumque-adipisci', 'Delectus dolor ratione voluptates.', 'Recusandae harum iure porro quo perspiciatis.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(40, 4, 3, NULL, 'Commodi error vel quidem corrupti occaecati fugit.', 'commodi-error-vel-quidem-corrupti-occaecati-fugit', 'Vitae soluta eius sunt quod quibusdam.', 'Aut est est nihil consequatur.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(41, 4, 1, NULL, 'Deserunt id totam et earum quo quis earum id.', 'deserunt-id-totam-et-earum-quo-quis-earum-id', 'Sit omnis excepturi qui.', 'Dolor reiciendis numquam voluptas.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(42, 4, 1, NULL, 'Corporis quam repudiandae optio.', 'corporis-quam-repudiandae-optio', 'Ducimus quia inventore qui officiis.', 'Adipisci ullam et molestias hic ullam provident cumque velit.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(43, 4, 3, NULL, 'Perspiciatis aut omnis eaque.', 'perspiciatis-aut-omnis-eaque', 'Praesentium molestias quia quia ducimus qui earum.', 'Delectus in quasi facere nam aut praesentium corporis.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(44, 4, 3, NULL, 'Minima facilis eos id possimus tempora libero aliquam.', 'minima-facilis-eos-id-possimus-tempora-libero-aliquam', 'Sint mollitia aliquam quidem rem enim.', 'Exercitationem accusamus omnis nihil sint.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(45, 4, 3, NULL, 'Et quisquam in eligendi temporibus dolore.', 'et-quisquam-in-eligendi-temporibus-dolore', 'Enim tempora voluptatem est praesentium esse sit corporis ut.', 'Illo consequatur voluptates blanditiis quas ea.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(46, 5, 2, NULL, 'Corporis omnis et provident illo quod cupiditate.', 'corporis-omnis-et-provident-illo-quod-cupiditate', 'Neque nihil aut exercitationem rerum non voluptatem excepturi nam.', 'Consequatur sit doloribus quo minus.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(47, 5, 3, NULL, 'Cum labore possimus quidem ipsa.', 'cum-labore-possimus-quidem-ipsa', 'Illum corrupti ab dicta harum.', 'Quod earum id quam.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(48, 5, 1, NULL, 'Quia labore vel culpa autem quia.', 'quia-labore-vel-culpa-autem-quia', 'Aliquid culpa possimus necessitatibus eligendi alias fuga dolorum.', 'Sint consequuntur accusantium quasi et sed quidem voluptatum.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(49, 5, 1, NULL, 'Non delectus consequatur sint beatae.', 'non-delectus-consequatur-sint-beatae', 'Ut soluta atque inventore non magnam.', 'Rerum totam sit omnis accusantium enim velit eos.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(50, 5, 1, NULL, 'Autem a facere fugiat autem impedit ipsum non et.', 'autem-a-facere-fugiat-autem-impedit-ipsum-non-et', 'Placeat quasi et nisi aliquam aut aperiam.', 'Amet dicta consequatur deleniti.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(51, 5, 3, NULL, 'Officiis vel aut perferendis dicta minus totam quia.', 'officiis-vel-aut-perferendis-dicta-minus-totam-quia', 'Blanditiis omnis neque consectetur ut beatae molestiae.', 'Accusantium quo ipsa nemo autem.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(52, 5, 2, NULL, 'Voluptatem earum dolorem animi reiciendis.', 'voluptatem-earum-dolorem-animi-reiciendis', 'Omnis impedit delectus dolorem quidem.', 'Rerum cupiditate eaque dolor et a recusandae.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(53, 5, 1, NULL, 'Laboriosam incidunt ut et odit eum alias.', 'laboriosam-incidunt-ut-et-odit-eum-alias', 'Et debitis id laudantium molestiae voluptas.', 'Repudiandae ut laboriosam repellendus necessitatibus iusto totam.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(54, 5, 1, NULL, 'Et accusamus et aut et voluptatem deleniti rem delectus.', 'et-accusamus-et-aut-et-voluptatem-deleniti-rem-delectus', 'Quod debitis voluptate pariatur earum consequatur nihil et sequi.', 'Numquam velit ea repellendus iste pariatur voluptatum voluptatem.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(55, 5, 1, NULL, 'Ut harum assumenda est aperiam.', 'ut-harum-assumenda-est-aperiam', 'Illo omnis ab aut architecto quas omnis incidunt.', 'Aut dolores non sint mollitia ea sequi natus.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(56, 5, 1, NULL, 'Repellat laboriosam voluptatum quod nihil vero.', 'repellat-laboriosam-voluptatum-quod-nihil-vero', 'Facilis nemo non dignissimos quis sed sit necessitatibus sit.', 'Quis provident quis suscipit cupiditate odio perspiciatis dolores voluptatum.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(57, 5, 1, NULL, 'Dolorem et veritatis dignissimos eum eligendi dolore.', 'dolorem-et-veritatis-dignissimos-eum-eligendi-dolore', 'Eos maxime delectus magni aspernatur nam aut et qui.', 'Et nam numquam et et perspiciatis.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(58, 5, 1, NULL, 'Nobis adipisci impedit facilis omnis.', 'nobis-adipisci-impedit-facilis-omnis', 'Pariatur consectetur numquam corporis aut mollitia sit sit.', 'Nihil et vero odit ut atque repellendus.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(59, 5, 3, NULL, 'Nisi eos ex tempore.', 'nisi-eos-ex-tempore', 'Nostrum nemo iste mollitia soluta.', 'Et aut ut ut minus voluptates dolores.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(60, 5, 1, NULL, 'Et qui molestias vitae repellendus.', 'et-qui-molestias-vitae-repellendus', 'Explicabo eius veritatis unde aut aut facilis alias numquam.', 'Exercitationem nostrum excepturi asperiores quis est voluptatem.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(61, 6, 1, NULL, 'Consequuntur quia consequatur mollitia temporibus accusantium tenetur.', 'consequuntur-quia-consequatur-mollitia-temporibus-accusantium-tenetur', 'Voluptatem provident odit qui laboriosam.', 'Provident et et ea.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(62, 6, 3, NULL, 'Nostrum quas quos enim sint ut.', 'nostrum-quas-quos-enim-sint-ut', 'Nihil ut culpa officia consequuntur perspiciatis et.', 'Tenetur veritatis debitis velit impedit nihil assumenda.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(63, 6, 1, NULL, 'Aut quos sunt cumque quasi et.', 'aut-quos-sunt-cumque-quasi-et', 'Modi qui et neque sint quis impedit.', 'Quibusdam sit cumque recusandae saepe culpa itaque.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(64, 6, 2, NULL, 'Sunt rem quibusdam non ipsum quo sit.', 'sunt-rem-quibusdam-non-ipsum-quo-sit', 'Ut aut omnis quia dolorum eos id impedit.', 'Tempore est accusantium laudantium et ad qui.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(65, 6, 2, NULL, 'Autem aliquid voluptatem debitis quos tempora voluptatem et.', 'autem-aliquid-voluptatem-debitis-quos-tempora-voluptatem-et', 'Nostrum sapiente rem illo natus dolor sit assumenda.', 'Qui rerum aut voluptas necessitatibus ut delectus.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(66, 6, 1, NULL, 'Voluptas quidem deserunt qui laboriosam aut.', 'voluptas-quidem-deserunt-qui-laboriosam-aut', 'Numquam impedit et occaecati velit a.', 'Odio in voluptas velit quia eligendi.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(67, 6, 1, NULL, 'Maxime id dolore hic error repudiandae ipsum.', 'maxime-id-dolore-hic-error-repudiandae-ipsum', 'Placeat ipsa eaque nisi quis dolor.', 'Nam harum nihil placeat asperiores.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(68, 6, 3, NULL, 'Voluptatem illo repellendus laudantium cum.', 'voluptatem-illo-repellendus-laudantium-cum', 'Placeat tempore qui ea labore earum enim voluptates delectus.', 'Sit alias maxime soluta laudantium quaerat earum.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(69, 6, 1, NULL, 'Necessitatibus facilis perspiciatis libero.', 'necessitatibus-facilis-perspiciatis-libero', 'Assumenda ex placeat voluptatibus hic dolore facilis eum hic.', 'Accusantium perspiciatis ratione voluptas dolorem.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(70, 6, 1, NULL, 'Eligendi ut distinctio quod qui sequi porro qui.', 'eligendi-ut-distinctio-quod-qui-sequi-porro-qui', 'Ipsa doloremque laboriosam nesciunt saepe voluptatum voluptatibus.', 'Consequatur quia omnis vitae.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(71, 6, 1, NULL, 'Laborum nam rerum eaque quia nisi illo.', 'laborum-nam-rerum-eaque-quia-nisi-illo', 'Est ratione qui et quo magnam magnam cumque.', 'Nihil distinctio animi commodi.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(72, 6, 1, NULL, 'Porro omnis et rerum blanditiis velit aut.', 'porro-omnis-et-rerum-blanditiis-velit-aut', 'Ut corporis doloremque dolore aut qui autem animi.', 'Voluptatem voluptatem a libero ullam consequatur.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(73, 6, 3, NULL, 'Repellendus enim doloremque modi dolorem architecto ut sunt.', 'repellendus-enim-doloremque-modi-dolorem-architecto-ut-sunt', 'Quae praesentium inventore sint dolores optio necessitatibus tempora.', 'Minima fugit sint eos sit id eos.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(74, 6, 2, NULL, 'Non dolorem adipisci et est adipisci.', 'non-dolorem-adipisci-et-est-adipisci', 'Dicta atque incidunt rem.', 'Iure nemo repellendus dolorum qui consequuntur et.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(75, 6, 1, NULL, 'In aperiam ab et itaque.', 'in-aperiam-ab-et-itaque', 'Labore magnam dolorem quia cupiditate excepturi.', 'Et quia maxime consequatur pariatur.', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(76, 1, 1, NULL, 'Test artikel', 'test-artikel', 'Cuma testing aje', 'Good', '2022-12-22 00:11:46', '2022-12-22 00:11:46'),
(77, 1, 2, NULL, 'Test Juga', 'test-juga', 'Test lagi', 'done', '2022-12-22 00:12:54', '2022-12-22 00:12:54'),
(78, 1, 3, 'images/articles/test-image.jpg', 'Test Image', 'test-image', 'Cuma testing', 'Ok', '2022-12-22 00:35:43', '2022-12-22 00:35:43'),
(79, 1, 2, 'images/articles/asdasasdasd.jpg', 'asdasasdasd', 'asdasasdasd', 'asdasaasdasda', 'asdasdasdasd', '2022-12-22 01:10:00', '2022-12-22 01:10:00'),
(80, 1, 3, 'images/articles/asdasdasdasd.jpg', 'asdasdasdasd', 'asdasdasdasd', 'asdasdasdasd', 'asdasdasd', '2022-12-22 01:11:47', '2022-12-22 01:11:47'),
(81, 1, 1, 'images/articles/asdasdawqwq1231.png', 'asdasdawqwq1231', 'asdasdawqwq1231', '12312312', '123123123', '2022-12-22 01:14:13', '2022-12-22 01:14:13'),
(83, 1, 2, NULL, 'Coba Testing Validasi', 'coba-testing-validasi', 'Coba Testing Validasi', 'Coba Testing Validasi', '2022-12-22 21:29:57', '2022-12-22 21:29:57'),
(84, 1, 1, 'images/articles/google-cloud.png', 'Google Cloud! - [Edited2]', 'google-cloud', 'Hi!', 'Hellow', '2022-12-23 01:13:23', '2022-12-25 20:03:39'),
(85, 1, 1, NULL, 'Coba Title yang sama (Updated3)', 'coba-title-yang-sama', 'Coba Title yang sama (Updated2)', 'Coba Title yang sama (Updated)\n<img src=sss onerror=\"alert(\'hello world\')\" />2', '2022-12-24 21:44:13', '2023-01-02 00:17:36'),
(88, 1, 1, 'images/articles/oke-fine.png', 'oke fine', 'oke-fine', 'testing', 'oke this is just trick test', '2022-12-27 05:44:57', '2022-12-27 05:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `article_tag`
--

CREATE TABLE `article_tag` (
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_tag`
--

INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES
(1, 4),
(2, 2),
(2, 3),
(3, 1),
(3, 3),
(4, 1),
(4, 3),
(5, 2),
(6, 1),
(7, 1),
(7, 4),
(8, 2),
(9, 1),
(9, 2),
(9, 4),
(10, 1),
(10, 2),
(11, 2),
(12, 1),
(12, 2),
(12, 4),
(13, 2),
(14, 2),
(15, 1),
(15, 3),
(15, 4),
(16, 2),
(16, 4),
(17, 1),
(17, 2),
(17, 3),
(18, 2),
(18, 3),
(18, 4),
(19, 1),
(19, 2),
(19, 3),
(20, 1),
(20, 4),
(21, 1),
(21, 2),
(21, 4),
(22, 1),
(22, 2),
(22, 3),
(23, 4),
(24, 4),
(25, 2),
(25, 4),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 2),
(28, 4),
(29, 1),
(29, 2),
(29, 4),
(30, 1),
(31, 1),
(31, 3),
(31, 4),
(32, 3),
(33, 4),
(34, 2),
(34, 3),
(35, 4),
(36, 1),
(36, 2),
(37, 2),
(37, 3),
(37, 4),
(38, 1),
(38, 2),
(38, 4),
(39, 3),
(40, 1),
(40, 3),
(41, 1),
(41, 3),
(41, 4),
(42, 1),
(42, 3),
(43, 2),
(44, 1),
(44, 3),
(44, 4),
(45, 1),
(46, 2),
(47, 2),
(47, 3),
(47, 4),
(48, 1),
(48, 3),
(48, 4),
(49, 2),
(50, 2),
(50, 4),
(51, 1),
(51, 2),
(51, 4),
(52, 2),
(52, 3),
(52, 4),
(53, 1),
(54, 2),
(54, 3),
(55, 1),
(55, 2),
(55, 4),
(56, 3),
(56, 4),
(57, 1),
(57, 3),
(57, 4),
(58, 1),
(59, 1),
(59, 2),
(60, 1),
(60, 3),
(60, 4),
(61, 3),
(61, 4),
(62, 1),
(62, 2),
(62, 4),
(63, 3),
(64, 1),
(64, 2),
(64, 3),
(65, 1),
(65, 2),
(65, 4),
(66, 4),
(67, 1),
(67, 3),
(67, 4),
(68, 3),
(69, 2),
(69, 4),
(70, 4),
(71, 4),
(72, 2),
(73, 1),
(73, 3),
(73, 4),
(74, 3),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 2),
(88, 1),
(88, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Blog', 'blog', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(2, 'Tutorial', 'tutorial', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(3, 'Package', 'package', '2022-12-20 01:59:42', '2022-12-20 01:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_20_080953_create_tags_table', 1),
(6, '2022_12_20_081137_create_articles_table', 1),
(7, '2022_12_20_081237_create_categories_table', 1),
(8, '2022_12_26_040130_create_roles_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-12-25 21:09:36', '2022-12-25 21:09:36'),
(2, 'writer', '2022-12-25 21:09:36', '2022-12-25 21:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Laravel', 'laravel', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(2, 'Html', 'html', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(3, 'CSS', 'css', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(4, 'Tailwind', 'tailwind', '2022-12-20 01:59:42', '2022-12-20 01:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rama Edwinda', 'ramaedwindap@gmail.com', '2022-12-20 01:59:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lRF0QmIqOZCSY0lebMf1HomTuuzIZM1055uELsJT2gQ4p5HG6GGFxS7sWc6Z', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(2, 'Lottie Dooley', 'claudia.frami@example.net', '2022-12-20 01:59:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5jTcIxIJuE', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(3, 'Florence Schneider', 'lreynolds@example.com', '2022-12-20 01:59:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XMVL9YFJs1', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(4, 'Torey Roob', 'madaline.purdy@example.net', '2022-12-20 01:59:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dELlK5snRy', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(5, 'Selmer Zieme', 'rmorar@example.org', '2022-12-20 01:59:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'K0WCMefZ9D', '2022-12-20 01:59:42', '2022-12-20 01:59:42'),
(6, 'Jacky O\'Connell', 'carol.rolfson@example.net', '2022-12-20 01:59:42', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '34JVPtYBrd', '2022-12-20 01:59:42', '2022-12-20 01:59:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`);

--
-- Indexes for table `article_tag`
--
ALTER TABLE `article_tag`
  ADD PRIMARY KEY (`article_id`,`tag_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`role_id`,`user_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
