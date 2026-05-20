import 'package:flutter/material.dart';

void main() {
  runApp(const PropeliumApp());
}

class PropeliumApp extends StatelessWidget {
  const PropeliumApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF0E7C66);
    const accent = Color(0xFFFFB703);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PROPELIUM',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          primary: primary,
          secondary: accent,
          surface: const Color(0xFFF6F8F7),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8F7),
        fontFamily: 'Roboto',
        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFFE3E8E5)),
          ),
        ),
      ),
      home: const PropeliumHome(),
    );
  }
}

class PropeliumHome extends StatefulWidget {
  const PropeliumHome({super.key});

  @override
  State<PropeliumHome> createState() => _PropeliumHomeState();
}

class _PropeliumHomeState extends State<PropeliumHome> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeDashboard(),
      const CatalogScreen(),
      const LearnerSpace(),
      const TrainerSpace(),
      const AdminSpace(),
    ];

    final wide = MediaQuery.sizeOf(context).width >= 900;

    return Scaffold(
      body: Row(
        children: [
          if (wide)
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() => selectedIndex = index);
              },
              labelType: NavigationRailLabelType.all,
              backgroundColor: Colors.white,
              leading: const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: BrandMark(compact: true),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.space_dashboard_outlined),
                  selectedIcon: Icon(Icons.space_dashboard),
                  label: Text('Accueil'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.school_outlined),
                  selectedIcon: Icon(Icons.school),
                  label: Text('Catalogue'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.play_circle_outline),
                  selectedIcon: Icon(Icons.play_circle),
                  label: Text('Apprenant'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.edit_note_outlined),
                  selectedIcon: Icon(Icons.edit_note),
                  label: Text('Formateur'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.admin_panel_settings_outlined),
                  selectedIcon: Icon(Icons.admin_panel_settings),
                  label: Text('Admin'),
                ),
              ],
            ),
          Expanded(child: pages[selectedIndex]),
        ],
      ),
      bottomNavigationBar: wide
          ? null
          : NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() => selectedIndex = index);
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.space_dashboard_outlined),
                  selectedIcon: Icon(Icons.space_dashboard),
                  label: 'Accueil',
                ),
                NavigationDestination(
                  icon: Icon(Icons.school_outlined),
                  selectedIcon: Icon(Icons.school),
                  label: 'Catalogue',
                ),
                NavigationDestination(
                  icon: Icon(Icons.play_circle_outline),
                  selectedIcon: Icon(Icons.play_circle),
                  label: 'Apprenant',
                ),
                NavigationDestination(
                  icon: Icon(Icons.edit_note_outlined),
                  selectedIcon: Icon(Icons.edit_note),
                  label: 'Formateur',
                ),
                NavigationDestination(
                  icon: Icon(Icons.admin_panel_settings_outlined),
                  selectedIcon: Icon(Icons.admin_panel_settings),
                  label: 'Admin',
                ),
              ],
            ),
    );
  }
}

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(
            title: 'PROPELIUM',
            subtitle: 'Plateforme e-learning pour former, certifier et suivre les talents.',
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth > 720;
              if (!wide) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeroPanel(),
                    SizedBox(height: 16),
                    PaymentPanel(),
                  ],
                );
              }

              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: HeroPanel()),
                  SizedBox(width: 16),
                  Expanded(child: PaymentPanel()),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              MetricCard(label: 'Formations', value: '42', icon: Icons.school),
              MetricCard(label: 'Apprenants', value: '1 280', icon: Icons.groups),
              MetricCard(label: 'Certificats', value: '318', icon: Icons.workspace_premium),
              MetricCard(label: 'Progression moyenne', value: '68%', icon: Icons.trending_up),
            ],
          ),
          const SizedBox(height: 24),
          SectionTitle(
            title: 'Formations en vedette',
            action: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
              label: const Text('Filtrer'),
            ),
          ),
          const CourseGrid(limit: 3),
        ],
      ),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(
            title: 'Catalogue des formations',
            subtitle: 'Management, finance, agro, diagnostic et gestion de projets.',
          ),
          SizedBox(height: 16),
          FilterBar(),
          SizedBox(height: 16),
          CourseGrid(),
        ],
      ),
    );
  }
}

class LearnerSpace extends StatelessWidget {
  const LearnerSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(
            title: 'Espace apprenant',
            subtitle: 'Cours suivis, vidéos protégées, quiz, certificats et paiements.',
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth > 780;
              if (!wide) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    VideoLessonCard(),
                    SizedBox(height: 16),
                    ProgressPanel(),
                  ],
                );
              }

              return const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: VideoLessonCard()),
                  SizedBox(width: 16),
                  Expanded(flex: 2, child: ProgressPanel()),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          const QuizCertificationRow(),
        ],
      ),
    );
  }
}

class TrainerSpace extends StatelessWidget {
  const TrainerSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(
            title: 'Espace formateur',
            subtitle: 'Créez vos modules, publiez les ressources et suivez vos revenus.',
          ),
          SizedBox(height: 16),
          TrainerStudio(),
        ],
      ),
    );
  }
}

class AdminSpace extends StatelessWidget {
  const AdminSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(
            title: 'Administration',
            subtitle: 'Utilisateurs, rôles, paiements, validations et statistiques globales.',
          ),
          SizedBox(height: 16),
          AdminDashboard(),
        ],
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: child,
          ),
        ),
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BrandMark(),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF14231F),
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF5C6D67),
                    ),
              ),
            ],
          ),
        ),
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.person_add_alt),
          label: const Text('S’inscrire'),
        ),
      ],
    );
  }
}

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: compact ? 48 : 54,
      height: compact ? 48 : 54,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          'P',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: compact ? 24 : 28,
          ),
        ),
      ),
    );
  }
}

class HeroPanel extends StatelessWidget {
  const HeroPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF12352E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              StatusChip(label: 'Flutter Web + Mobile'),
              StatusChip(label: 'Spring Boot API'),
              StatusChip(label: 'PostgreSQL'),
            ],
          ),
          const SizedBox(height: 34),
          Text(
            'Former, suivre, certifier.',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'Une expérience unifiée pour les apprenants, les formateurs et les administrateurs, avec vidéo sécurisée, quiz, certificats et paiements locaux.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFFD9E6E1),
                  height: 1.45,
                ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
                label: const Text('Commencer'),
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFB6D2C9)),
                ),
                onPressed: () {},
                icon: const Icon(Icons.video_library_outlined),
                label: const Text('Voir les cours'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentPanel extends StatelessWidget {
  const PaymentPanel({super.key});

  @override
  Widget build(BuildContext context) {
    const payments = ['Orange Money', 'Moov', 'Wave', 'Stripe', 'PayPal'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Paiements intégrés',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 12),
            ...payments.map(
              (payment) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.verified_outlined),
                title: Text(payment),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFE5F2EE),
                foregroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(icon),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    Text(label, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, this.action});

  final String title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
        if (action != null) action!,
      ],
    );
  }
}

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    const filters = ['Management', 'Finance', 'Agro', 'Débutant', 'Payant'];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: filters
          .map(
            (filter) => FilterChip(
              selected: filter == 'Management',
              onSelected: (_) {},
              label: Text(filter),
              avatar: Icon(
                filter == 'Payant' ? Icons.payments_outlined : Icons.tune,
                size: 18,
              ),
            ),
          )
          .toList(),
    );
  }
}

class CourseGrid extends StatelessWidget {
  const CourseGrid({super.key, this.limit});

  final int? limit;

  @override
  Widget build(BuildContext context) {
    final courses = sampleCourses.take(limit ?? sampleCourses.length).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width > 980 ? 3 : width > 640 ? 2 : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: courses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisExtent: 270,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
          ),
          itemBuilder: (context, index) => CourseCard(course: courses[index]),
        );
      },
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 72,
            padding: const EdgeInsets.all(14),
            color: course.color,
            child: Row(
              children: [
                Icon(course.icon, color: Colors.white, size: 30),
                const Spacer(),
                const Icon(Icons.lock_outline, color: Colors.white70),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.category,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  course.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${course.modules} modules • ${course.level}',
                  style: const TextStyle(color: Color(0xFF66746F)),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: course.progress,
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('${(course.progress * 100).round()}%'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoLessonCard extends StatelessWidget {
  const VideoLessonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF12352E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(Icons.play_circle_fill, color: Colors.white, size: 70),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Diagnostic stratégique - Leçon 03',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 6),
            const Text('Streaming Vimeo/S3 protégé, ressources consultables dans l’application.'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Marquer comme vue'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: const Text('Ressource PDF'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressPanel extends StatelessWidget {
  const ProgressPanel({super.key});

  @override
  Widget build(BuildContext context) {
    const rows = [
      ('Modules terminés', '6 / 10'),
      ('Quiz réussis', '4 / 5'),
      ('Score moyen', '82%'),
      ('Certificat', 'Débloqué à 90%'),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Progression',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 16),
            const LinearProgressIndicator(value: 0.68, minHeight: 10),
            const SizedBox(height: 16),
            ...rows.map(
              (row) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.insights_outlined),
                title: Text(row.$1),
                trailing: Text(
                  row.$2,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizCertificationRow extends StatelessWidget {
  const QuizCertificationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: const [
        ActionTile(
          icon: Icons.quiz_outlined,
          title: 'Quiz & examens',
          subtitle: 'QCM, vrai/faux, score et correction automatique.',
        ),
        ActionTile(
          icon: Icons.workspace_premium_outlined,
          title: 'Certificats PDF',
          subtitle: 'Nom, formation, date, signature et cachet PROPELIUM.',
        ),
        ActionTile(
          icon: Icons.chat_bubble_outline,
          title: 'Messagerie',
          subtitle: 'Chat formateur-apprenant avec WebSockets.',
        ),
      ],
    );
  }
}

class TrainerStudio extends StatelessWidget {
  const TrainerStudio({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width > 920 ? 3 : width > 620 ? 2 : 1;
        const items = [
          ActionTile(
            icon: Icons.add_box_outlined,
            title: 'Créer une formation',
            subtitle: 'Titre, objectifs, catégorie, prix et image.',
          ),
          ActionTile(
            icon: Icons.video_call_outlined,
            title: 'Ajouter une leçon',
            subtitle: 'Vidéo, PDF, texte, ressources et ordre des modules.',
          ),
          ActionTile(
            icon: Icons.groups_2_outlined,
            title: 'Suivre les inscrits',
            subtitle: 'Progression moyenne, messages et modération.',
          ),
          ActionTile(
            icon: Icons.payments_outlined,
            title: 'Revenus',
            subtitle: 'Paiements confirmés, commissions et historique.',
          ),
          ActionTile(
            icon: Icons.live_tv_outlined,
            title: 'Sessions live',
            subtitle: 'Liens Zoom ou Google Meet associés au cours.',
          ),
          ActionTile(
            icon: Icons.comment_outlined,
            title: 'Commentaires',
            subtitle: 'Réponses aux questions sous chaque leçon.',
          ),
        ];

        return GridView.count(
          crossAxisCount: columns,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 1.7,
          children: items,
        );
      },
    );
  }
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const rows = [
      ('Awa Traoré', 'APPRENANT', 'Actif'),
      ('Koffi Mensah', 'FORMATEUR', 'Validation cours'),
      ('Admin PROPELIUM', 'ADMIN', 'Actif'),
      ('Mariam Diallo', 'APPRENANT', 'Paiement en attente'),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                MetricCard(label: 'Utilisateurs', value: '1 492', icon: Icons.people),
                MetricCard(label: 'Paiements', value: '7,8M', icon: Icons.payments),
                MetricCard(label: 'Formations à valider', value: '9', icon: Icons.fact_check),
              ],
            ),
            const SizedBox(height: 18),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Utilisateur')),
                  DataColumn(label: Text('Rôle')),
                  DataColumn(label: Text('Statut')),
                  DataColumn(label: Text('Action')),
                ],
                rows: rows
                    .map(
                      (row) => DataRow(
                        cells: [
                          DataCell(Text(row.$1)),
                          DataCell(Text(row.$2)),
                          DataCell(Text(row.$3)),
                          const DataCell(Icon(Icons.more_horiz)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionTile extends StatelessWidget {
  const ActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFE5F2EE),
                foregroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(icon),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Color(0xFF66746F)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFF24584E),
      labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      side: BorderSide.none,
    );
  }
}

class Course {
  const Course({
    required this.title,
    required this.category,
    required this.level,
    required this.modules,
    required this.progress,
    required this.icon,
    required this.color,
  });

  final String title;
  final String category;
  final String level;
  final int modules;
  final double progress;
  final IconData icon;
  final Color color;
}

const sampleCourses = [
  Course(
    title: 'Diagnostic organisationnel et performance',
    category: 'Diagnostic',
    level: 'Intermédiaire',
    modules: 10,
    progress: 0.68,
    icon: Icons.analytics_outlined,
    color: Color(0xFF0E7C66),
  ),
  Course(
    title: 'Gestion de projets orientée résultats',
    category: 'Projets',
    level: 'Débutant',
    modules: 8,
    progress: 0.35,
    icon: Icons.account_tree_outlined,
    color: Color(0xFF2F5D8C),
  ),
  Course(
    title: 'Finance appliquée aux PME africaines',
    category: 'Finance',
    level: 'Avancé',
    modules: 12,
    progress: 0.12,
    icon: Icons.savings_outlined,
    color: Color(0xFF9A5B1F),
  ),
  Course(
    title: 'Agro-business et transformation locale',
    category: 'Agro',
    level: 'Intermédiaire',
    modules: 9,
    progress: 0.0,
    icon: Icons.agriculture_outlined,
    color: Color(0xFF4F7A32),
  ),
  Course(
    title: 'Leadership et management opérationnel',
    category: 'Management',
    level: 'Débutant',
    modules: 7,
    progress: 0.9,
    icon: Icons.leaderboard_outlined,
    color: Color(0xFF7E4E90),
  ),
];
